# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{RingRingAds}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Cale"]
  s.date = %q{2010-03-10}
  s.email = %q{jase@jaseandtonic.com}
  s.files = ["lib/advert.rb"]
  s.homepage = %q{http://jaseandtonic.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Very basic wrapper to grab adverts from RingRingMedia}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end
