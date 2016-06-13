# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rong_cloud_im/version'

Gem::Specification.new do |s|
  s.name          = 'rong_cloud_im'
  s.version       = RongCloudIM::VERSION
  s.date          = '2016-06-13'
  s.summary       = "融云IM API"
  s.description   = "融云IM server接口调用"
  s.authors       = ["fwshun8023"]
  s.email         = ['fwshun8023@gmai.com']
  s.homepage      = 'https://github.com/fwshun8023/rong_cloud_im'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end