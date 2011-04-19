# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tuev}
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["kesselborn"]
  s.date = %q{2011-04-19}
  s.default_executable = %q{tuev}
  s.description = %q{...}
  s.email = %q{daniel@soundcloud.com}
  s.executables = ["tuev"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".gitmodules",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/tuev",
    "contrib/jquery-1.5.1.js",
    "contrib/mockjax/jquery.mockjax.js",
    "contrib/qunit/qunit/qunit.css",
    "contrib/qunit/qunit/qunit.js",
    "contrib/test_default.html",
    "contrib/tuev.yml",
    "contrib/tuev_helper.rb",
    "contrib/tuev_qunit.js",
    "lib/tasks/tuev.rake",
    "lib/tuev.rb",
    "lib/tuev/tuev.rb",
    "lib/tuev/tuev_runner.rb",
    "spec/fixtures/fake_root/config/tuev.yml",
    "spec/fixtures/file_layout1.txt",
    "spec/spec_helper.rb",
    "spec/tuev_spec.rb",
    "tuev.gemspec",
    "tuev_helper.rb"
  ]
  s.homepage = %q{http://github.com/kesselborn/tuev}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{run qunit & selenium tests with rake}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/tuev_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<selenium-client>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<tuev>, [">= 0"])
      s.add_development_dependency(%q<bacon>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<selenium-client>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<tuev>, [">= 0"])
      s.add_dependency(%q<bacon>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<selenium-client>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<tuev>, [">= 0"])
    s.add_dependency(%q<bacon>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

