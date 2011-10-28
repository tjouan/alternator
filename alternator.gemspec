$LOAD_PATH << File.join(File.dirname(__FILE__), '/lib')
require 'alternator/version'

Gem::Specification.new do |s|
  s.name    = 'alternator'
  s.version = Alternator::VERSION
  s.summary = "alternator-#{Alternator::VERSION}"
  s.description = <<-eoh.gsub(/^ +/, '')
    Alternator generates alternative wrapper scripts; it helps you stubbing
    executed files.
  eoh

  s.author  = 'Thibault Jouan'
  s.email   = 'tj@a13.fr'

  s.files       = `git ls-files`.split "\n"
  s.test_files  = `git ls-files -- {test,features}/*`.split "\n"
  s.executables = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end

  s.add_development_dependency 'aruba'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rake'
end
