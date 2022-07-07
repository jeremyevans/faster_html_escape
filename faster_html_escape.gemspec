spec = Gem::Specification.new do |s| 
  s.name = "faster_html_escape"
  s.version = "1.0.0"
  s.author = "Jeremy Evans"
  s.email = "jeremyevans0@gmail.com"
  s.homepage = "http://rubyforge.org/projects/fasterh/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Faster version of ERB::Util.html_escape"
  s.files = Dir["*"]
  s.require_paths = ["."]
  s.extensions << 'extconf.rb'
  s.autorequire = "faster_html_escape"
  s.test_files = Dir["test/*"]
  s.has_rdoc = true
  s.rubyforge_project = 'fasterh'
end

