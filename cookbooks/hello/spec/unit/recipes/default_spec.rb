#
# Cookbook Name:: hello
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'hello::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'installs httpd' do
      expect(chef_run).to install_package "httpd"
    end

    it 'starts the httpd service' do
      expect(chef_run).to start_service "httpd"
    end
  end

  context 'When all attributes are default, on an ubuntu platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => "ubuntu", :version => "12.04")
      runner.converge(described_recipe)
    end

    it "installs apache2" do
      expect(chef_run).to install_package "apache2"
    end
  end
end
