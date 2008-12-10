# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{icontact}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nate Miller"]
  s.date = %q{2008-12-10}
  s.description = %q{Interact with the iContact email subscription service.}
  s.email = %q{nate@urbaninfluence.com}
  s.extra_rdoc_files = ["lib/icontact.rb", "README.rdoc"]
  s.files = ["lib/icontact.rb", "Rakefile", "README.rdoc", "Manifest", "icontact.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://projects.urbaninfluence.com/gems}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Icontact", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{icontact}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Interact with the iContact email subscription service.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<facets>, [">= 0"])
    else
      s.add_dependency(%q<facets>, [">= 0"])
    end
  else
    s.add_dependency(%q<facets>, [">= 0"])
  end
end
