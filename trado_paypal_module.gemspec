$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "trado_paypal_module/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trado_paypal_module"
  s.version     = TradoPaypalModule::VERSION
  s.authors     = ["Tom Dallimore"]
  s.email       = ["me@tomdallimore.com"]
  s.homepage    = "http://trado.io"
  s.summary     = "TODO: Summary of TradoPaypalModule."
  s.description = "TODO: Description of TradoPaypalModule."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency 'offsite_payments'
  s.add_dependency 'activemerchant', '1.43.3'

  s.add_development_dependency "sqlite3"
end
