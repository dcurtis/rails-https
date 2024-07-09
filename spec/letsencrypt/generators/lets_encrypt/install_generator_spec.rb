# frozen_string_literal: true

require 'rails_helper'
require 'rails/generators/test_case'
require 'generators/lets_encrypt/install_generator'

RSpec.describe LetsEncrypt::Generators::InstallGenerator do
  let(:klass) do
    Class.new(Rails::Generators::TestCase) do
      tests LetsEncrypt::Generators::InstallGenerator
      destination Rails.root.join('tmp')
    end
  end

  let(:generator) { klass.new(:fake_test_case) }

  before do
    generator.send(:prepare_destination)
    generator.run_generator
  end

  it do
    generator.assert_migration 'db/migrate/create_certificates.rb', /def change/
  end
end
