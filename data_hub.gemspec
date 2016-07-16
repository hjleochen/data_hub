$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "data_hub/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "data_hub"
  s.version     = DataHub::VERSION
  s.authors     = ["H.J.LeoChen"]
  s.email       = ["hjleochen@hotmail.com"]
  s.homepage    = "http://www.upulife.com"
  s.summary     = "Summary of DataHub."
  s.description = "Description of DataHub."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", '>= 4.0.0'

  s.add_dependency "sass-rails", '>= 3.2'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'ransack'
  s.add_dependency 'bootstrap-sass', '~> 3.3.6'

  s.add_development_dependency "mysql2"
end
