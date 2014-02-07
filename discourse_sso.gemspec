$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "discourse_sso/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "discourse_sso"
  s.version     = DiscourseSso::VERSION
  s.authors     = ["Your name"]
  s.email       = ["Your email"]
  s.homepage    = ""
  s.summary     = "Summary of DiscourseSso."
  s.description = "Description of DiscourseSso."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
