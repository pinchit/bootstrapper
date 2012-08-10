# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bootstrapper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lou Kosak"]
  gem.email         = ["lkosak@gmail.com"]
  gem.description   = %q{Bootstrap it up! Send your data to backbone.}
  gem.summary       = %q{This is a great way to do a little bootstrapping}
  gem.homepage      = "http://github.com/pinchit/bootstrapper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bootstrapper"
  gem.require_paths = ["lib"]
  gem.version       = Bootstrapper::VERSION
end
