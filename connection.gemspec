# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'connection'
  s.version = '0.1.0.0'
  s.summary = 'TCP client/server connection library offering both blocking and non/blocking operation'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/connection'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_runtime_dependency 'telemetry-logger'

  s.add_development_dependency 'test_bench'
end
