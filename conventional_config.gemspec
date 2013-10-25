$:.push File.expand_path('../lib', __FILE__)

require 'conventional_config/version'

Gem::Specification.new do |s|
  s.name        = 'conventional_config'
  s.version     = ConventionalConfig::VERSION
  s.authors     = ['Phil Monroe']
  s.email       = %w(phil@philmonroe.com)
  s.homepage    = 'https://github.com/Identified/conventional_config'
  s.summary     = 'Better Rails Configuration'
  s.description = 'Better Rails Configuration by auto generating classes to represent YAML configs'

  s.files = Dir['{app,config,db,lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)
  s.test_files = Dir['{test, spec}/**/*']

  s.add_dependency 'hashie'

  s.add_development_dependency 'rails', '3.2.15'
  s.add_development_dependency 'sqlite3' # TODO remove
end
