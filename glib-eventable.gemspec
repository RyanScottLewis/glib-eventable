# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "glib-eventable"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Scott Lewis"]
  s.date = "2012-11-18"
  s.description = "This is a helper gem for ruby-gnome2 applications that allows developers to easily connect signals to methods."
  s.email = "ryan@rynet.us"
  s.files = [".gitignore", ".rvmrc", "Gemfile", "Gemfile.lock", "Guardfile", "LICENSE", "README.md", "Rakefile", "VERSION", "glib-eventable.gemspec", "lib/glib-eventable.rb", "lib/glib/eventable.rb"]
  s.homepage = "http://github.com/c00lryguy/glib-eventable"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "This is a helper gem for ruby-gnome2 applications."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<version>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<glib2>, ["~> 1.1.5"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<guard-yard>, ["~> 2.0.1"])
      s.add_development_dependency(%q<redcarpet>, ["~> 2.2.2"])
    else
      s.add_dependency(%q<version>, ["~> 1.0.0"])
      s.add_dependency(%q<glib2>, ["~> 1.1.5"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<guard-yard>, ["~> 2.0.1"])
      s.add_dependency(%q<redcarpet>, ["~> 2.2.2"])
    end
  else
    s.add_dependency(%q<version>, ["~> 1.0.0"])
    s.add_dependency(%q<glib2>, ["~> 1.1.5"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<guard-yard>, ["~> 2.0.1"])
    s.add_dependency(%q<redcarpet>, ["~> 2.2.2"])
  end
end
