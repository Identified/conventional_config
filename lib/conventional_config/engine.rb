if defined?(::Rails)
  module ConventionalConfig
    class Engine < ::Rails::Engine
      initializer 'conventional_config.load_yaml_configs', before: :load_environment_hook do |app|
        paths = app.config.paths['config/yamls'] || %W(#{app.root}/config/settings)
        ConventionalConfig.generate_classes!(paths)
      end
    end
  end
end
