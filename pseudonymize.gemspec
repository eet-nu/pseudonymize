Gem::Specification.new do |s|
  s.name        = 'pseudonymize'
  s.version     = '0.0.3'
  s.date        = '2018-05-14'
  s.summary     = "A gem that pseudonymizes data."
  s.description = "A gem that pseudonymizes data."
  s.authors     = ["Tom-Eric Gerritsen"]
  s.email       = 'tomeric@eet.nu'
  s.files       = `git ls-files`.split("\n").reject { |f| f.match(%r{^(test)/}) }
  s.homepage    = 'http://rubygems.org/gems/pseudonymize'
  s.license     = 'MIT'
end
