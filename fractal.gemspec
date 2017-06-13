Gem::Specification.new do |s|
  s.name        = 'fractal'
  s.version     = '0.1.4'
  s.required_ruby_version = '>= 1.9.2'
  s.executables << 'fractal'
  s.add_runtime_dependency 'chunky_png', '~> 1.3', '>= 1.3.8'
  s.date        = '2017-06-13'
  s.summary     = "Draws fractal PNG images."
  s.description = "Creates PNG images of fractals."
  s.authors     = ["Demonstrandum"]
  s.email       = 'knutsen@jetspace.co'
  s.files       = ["lib/fractal.rb"]
  s.homepage    = 'https://github.com/Demonstrandum/Fractal'
  s.license     = 'GPL-3.0'
end
