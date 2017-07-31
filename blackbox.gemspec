# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blackbox/version'

Gem::Specification.new do |spec|
  spec.name          = "blackbox"
  spec.version       = Blackbox::VERSION
  spec.authors       = ["Robert MacCracken"]
  spec.email         = ["robert.maccracken@thr.com"]

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "http://mygemserver.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "rspec_junit_formatter", "~> 0.3"
  spec.add_development_dependency "watir", "~> 6.5"
  spec.add_development_dependency "selenium-webdriver", "3.4.0"
  spec.add_development_dependency "watir-performance", "~> 0.3.1"
  spec.add_development_dependency "page-object", "~> 2.1"
end