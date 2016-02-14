# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_hashtag/version'

Gem::Specification.new do |spec|
  spec.name          = "twitter_hashtag"
  spec.version       = TwitterHashtag::VERSION
  spec.authors       = ["deathliger666"]
  spec.email         = ["oleg.golovin13@gmail.com"]

  spec.summary       = %q{Search twitter hashtags from the command line}
  s.description      = %q{Search twitter hashtags from the command line}
  spec.homepage      = "https://github.com/deathliger666"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  s.add_runtime_dependency 'json', '~> 1.4.6'
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
