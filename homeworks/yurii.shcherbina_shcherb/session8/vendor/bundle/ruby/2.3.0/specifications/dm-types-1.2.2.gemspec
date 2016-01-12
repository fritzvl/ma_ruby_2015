# -*- encoding: utf-8 -*-
# stub: dm-types 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dm-types"
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dan Kubb"]
  s.date = "2012-08-02"
  s.description = "DataMapper plugin providing extra data types"
  s.email = ["dan.kubb@gmail.com"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://datamapper.org"
  s.rubygems_version = "2.5.1"
  s.summary = "DataMapper plugin providing extra data types"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bcrypt-ruby>, ["~> 3.0"])
      s.add_runtime_dependency(%q<fastercsv>, ["~> 1.5"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<json>, ["~> 1.6"])
      s.add_runtime_dependency(%q<stringex>, ["~> 1.4"])
      s.add_runtime_dependency(%q<uuidtools>, ["~> 2.1"])
      s.add_runtime_dependency(%q<dm-core>, ["~> 1.2.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3"])
    else
      s.add_dependency(%q<bcrypt-ruby>, ["~> 3.0"])
      s.add_dependency(%q<fastercsv>, ["~> 1.5"])
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<json>, ["~> 1.6"])
      s.add_dependency(%q<stringex>, ["~> 1.4"])
      s.add_dependency(%q<uuidtools>, ["~> 2.1"])
      s.add_dependency(%q<dm-core>, ["~> 1.2.0"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<rspec>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<bcrypt-ruby>, ["~> 3.0"])
    s.add_dependency(%q<fastercsv>, ["~> 1.5"])
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<json>, ["~> 1.6"])
    s.add_dependency(%q<stringex>, ["~> 1.4"])
    s.add_dependency(%q<uuidtools>, ["~> 2.1"])
    s.add_dependency(%q<dm-core>, ["~> 1.2.0"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<rspec>, ["~> 1.3"])
  end
end
