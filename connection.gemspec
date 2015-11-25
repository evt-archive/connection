# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'connection'
  s.version = '0.2.0'
  s.summary = 'TCP client/server connection library'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'opensource@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/connection'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'clock'
  s.add_runtime_dependency 'telemetry-logger'

  s.add_development_dependency 'benchmark-ips'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-spec-context'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'process_host'
  s.add_development_dependency 'runner'
end
