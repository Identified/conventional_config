require 'spec_helper'

describe ConventionalConfig do
  context 'Given a configuration file for Manifold' do
    before do
      @manifold_config = "#{Dummy::Application.config.root}/config/settings/manifold.yml"
      expect(File.exist?(@manifold_config)).to be_true
    end

    it 'creates a config class' do
      expect(ConventionalConfig::Configs::Manifold).to_not raise_error(NameError)
    end

    describe 'the config class' do
      let(:test_config) { ConventionalConfig::Configs::Manifold }
      let(:full_config) { ConventionalConfig::Configs::Manifold.full }

      it 'filters the first level elements by environment (i.e. returns the value for /test/' do
        expect(test_config.host).to eq 'test-manifold.identified.dev'
        expect(test_config.users_path).to eq '/api/v1/users/:id'
      end

      it 'gives access to the full hash' do
        expect(full_config.development.host).to eq 'manifold.identified.dev'
        expect(full_config.test.host).to eq 'test-manifold.identified.dev'
        expect(full_config.staging.host).to eq 'stg-manifold.identified.com'
        expect(full_config.production.host).to eq 'prd-manifold.identified.com'
        expect(full_config.development.users_path).to eq '/api/v1/users/:id'
        expect(full_config.test.users_path).to eq '/api/v1/users/:id'
        expect(full_config.staging.users_path).to eq '/api/v1/users/:id'
        expect(full_config.production.users_path).to eq '/api/v1/users/:id'
      end
    end
  end
end
