# -*- encoding: utf-8 -*-
# stub: bcrypt-ruby 3.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "bcrypt-ruby"
  s.version = "3.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Coda Hale"]
  s.date = "2014-02-21"
  s.description = "    bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project\n    for hashing passwords. The bcrypt Ruby gem provides a simple wrapper for safely handling\n    passwords.\n"
  s.email = "coda.hale@gmail.com"
  s.extra_rdoc_files = ["README.md", "COPYING", "CHANGELOG", "lib/bcrypt/dummy.rb"]
  s.files = ["CHANGELOG", "COPYING", "README.md", "lib/bcrypt/dummy.rb"]
  s.homepage = "https://github.com/codahale/bcrypt-ruby"
  s.licenses = ["MIT"]
  s.post_install_message = "\n#######################################################\n\nThe bcrypt-ruby gem has changed its name to just bcrypt.  Instead of\ninstalling `bcrypt-ruby`, you should install `bcrypt`.  Please update your\ndependencies accordingly.\n\n#######################################################\n\n"
  s.rdoc_options = ["--title", "bcrypt-ruby", "--line-numbers", "--inline-source", "--main", "README.md"]
  s.rubygems_version = "2.5.1"
  s.summary = "OpenBSD's bcrypt() password hashing algorithm."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.9.2"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_runtime_dependency(%q<bcrypt>, [">= 3.1.3"])
    else
      s.add_dependency(%q<rake-compiler>, ["~> 0.9.2"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bcrypt>, [">= 3.1.3"])
    end
  else
    s.add_dependency(%q<rake-compiler>, ["~> 0.9.2"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bcrypt>, [">= 3.1.3"])
  end
end
