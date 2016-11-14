# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coolpay_app/version'

Gem::Specification.new do |spec|
  spec.name          = "coolpay_app"
  spec.version       = CoolpayApp::VERSION
  spec.authors       = ["Luigi Riefolo"]
  spec.email         = ["luigi.riefolo@gmail.com"]
  spec.files         = ["lib/coolplay_app.rb"]
  spec.homepage      = "https://github.com/luigi-riefolo/coolpay_app"

  spec.summary       = %q{Ruby Coolpay app.}
  spec.description   = <<-EOF
    CoolpayApp is a simple app for interacting with the Coolpay API.
   
    The app can be used to:
     
    - Authenticate a user to the Coolpay API
    - Add one or more recipients for a payment
    - Send money money to the list of recipients
    - Check whether a payment was successful

    The Coolpay documentation can be found here:

      http://docs.coolpayapi.apiary.io/

  EOF

  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(docs|spec|features)/})
  end
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables   = ["coolpay"]
  spec.require_paths = ["lib"]
  spec.extra_rdoc_files = ['LICENSE.txt', 'README.md']


  # Declare that the Gem is compatible
  # with version 2.0 or greater
  spec.required_ruby_version = ">= 2.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "rest-client", "~> 1.8.0"
end
