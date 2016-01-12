# -*- encoding: utf-8 -*-
# stub: dm-core 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dm-core"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dan Kubb"]
  s.date = "2013-06-10"
  s.description = "DataMapper core library"
  s.email = ["dan.kubb@gmail.com"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "https://github.com/datamapper/dm-core"
  s.rubygems_version = "2.5.1"
  s.summary = "DataMapper core library"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, ["~> 2.3"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.3"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3.2"])
    else
      s.add_dependency(%q<addressable>, ["~> 2.3"])
      s.add_dependency(%q<rake>, ["~> 10.0.3"])
      s.add_dependency(%q<rspec>, ["~> 1.3.2"])
    end
  else
    s.add_dependency(%q<addressable>, ["~> 2.3"])
    s.add_dependency(%q<rake>, ["~> 10.0.3"])
    s.add_dependency(%q<rspec>, ["~> 1.3.2"])
  end
end
