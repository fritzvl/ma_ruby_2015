# -*- encoding: utf-8 -*-
# stub: stringex 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "stringex"
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Russell Norris"]
  s.date = "2012-11-30"
  s.description = "Some [hopefully] useful extensions to Ruby's String class. Stringex is made up of three libraries: ActsAsUrl [permalink solution with better character translation], Unidecoder [Unicode to ASCII transliteration], and StringExtensions [miscellaneous helper methods for the String class]."
  s.email = "rsl@luckysneaks.com"
  s.extra_rdoc_files = ["MIT-LICENSE", "README.rdoc"]
  s.files = ["MIT-LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/rsl/stringex"
  s.rdoc_options = ["--main", "README.rdoc", "--charset", "utf-8", "--line-numbers"]
  s.rubygems_version = "2.5.1"
  s.summary = "Some [hopefully] useful extensions to Ruby's String class"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["= 1.8.4"])
      s.add_development_dependency(%q<RedCloth>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<travis-lint>, ["= 1.4.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["= 1.8.4"])
      s.add_dependency(%q<RedCloth>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<travis-lint>, ["= 1.4.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["= 1.8.4"])
    s.add_dependency(%q<RedCloth>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<travis-lint>, ["= 1.4.0"])
  end
end
