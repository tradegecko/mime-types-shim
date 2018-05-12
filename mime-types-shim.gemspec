# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mime-types-shim/version'

Gem::Specification.new do |spec|
  spec.name          = "mime-types"
  spec.version       = MimeTypesShim::VERSION
  spec.authors       = ["Bradley Priest"]
  spec.email         = ["bradley@tradegecko.com"]
  spec.description   = %q{Shim for gems unwilling to switch to mini_mime}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/tradegecko/mime-types-shim"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mini_mime"
end
