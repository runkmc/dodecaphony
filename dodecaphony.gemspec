Gem::Specification.new do |s|
  s.name        = "dodecaphony"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.date        = "2014-06-19"
  s.summary     = "Tone Row Calculator"
  s.description = "A gem for calculating twelve-tone rows"
  s.authors     = ["Kevin McGladdery"]
  s.email       = ["kevin.mcgladdery@gmail.com"]
  s.homepage    = "http://github.com/runkmc/dodecaphony"
  s.license     = "MIT"

  files = []
  files << 'LICENSE'
  files << 'Readme.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  s.files         = files
  s.test_files = Dir.glob('spec/*.rb')
  s.require_paths = ["lib"]
  s.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.1'
end
