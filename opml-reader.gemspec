# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "opml-reader/version"

Gem::Specification.new do |s|
  s.name        = "opml-reader"
  s.version     = Opml::Reader::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Amar Daxini"]
  s.email       = ["amardaxini@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/opml-reader"
  s.summary     = %q{parse opml file using nokogiri}
  s.description = %q{parse opml file using nokogiri,it generates head and body of opml}

  s.rubyforge_project = "opml-reader"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency 'nokogiri'
end
