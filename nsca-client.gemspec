lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nsca/client/version"

Gem::Specification.new do |gem|
  gem.authors       = `git log --raw | grep Author: | awk -F ': | <|>' '{ print $2 }' | sort | uniq`.split("\n")
  gem.email         = `git log --raw | grep Author: | awk -F ': | <|>' '{ print $3 }' | sort | uniq`.split("\n")
  gem.description   = %q{Send passive notifications to Nagios Service Check Acceptor (NSCA).}
  gem.summary       = %q{NSCA Client}
  gem.homepage      = "https://github.com/felipecvo/nsca-client"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.name          = "nsca-client"
  gem.require_paths = ["lib"]
  gem.version       = NSCA::Client::VERSION

  gem.add_dependency "send_nsca"

  gem.add_development_dependency "rspec"
end
