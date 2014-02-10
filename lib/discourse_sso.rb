module DiscourseSso
  module ControllerExtensions
    def self.included(klass)
      klass.append_before_filter :ensure_sso_login
    end

    private

    def ensure_sso_login
      if cookies[:discourse_sso_cookie].present?
        cookie_user_id = cookies[:discourse_sso_cookie] # makes sense to have this value encrypted in the cookie
        unless current_user && current_user.id == cookie_user_id.to_i
          user = User.find cookie_user_id
          log_on_user(user)
          redirect_to url_for # we need to "reload" the page, so the user sees that he's logged in
        end
      else
        reset_session
        cookies[:_t] = nil
      end
    end
  end

  class Engine < Rails::Engine
    engine_name 'discourse_sso'

    initializer "discourse_sso.rails_initialization" do |app|
      app.config.after_initialize do
        ActiveSupport.on_load(:action_controller) do
          include DiscourseSso::ControllerExtensions
        end
      end
    end
  end
end