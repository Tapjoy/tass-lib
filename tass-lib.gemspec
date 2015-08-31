require File.expand_path('../lib/tapjoy/tass-lib/version', __FILE__)
Gem::Specification.new do |s|
  s.name                  = 'tass-lib'
  s.version               = Tapjoy::TassLib::VERSION
  s.date                  = '2015-07-22'
  s.summary               = 'Library Gem for Tapjoy Autoscaling Suite'
  s.description           = 'Supports Tapjoy AWS tools, primarily TassLib'
  s.authors               = ['Ali Tayarani']
  s.email                 = 'ali.tayarani@tapjoy.com'
  s.files                 = Dir['lib/tapjoy/**/**']
  s.homepage              = 'https://github.com/Tapjoy/tass-lib'
  s.license               = 'MIT'
  s.required_ruby_version = '~> 2.0'
  s.add_runtime_dependency('aws-sdk', '~> 2.0')
end
