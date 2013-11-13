require 'spec_helper'

describe 'r10k', :type => :class do

  it { should create_class('r10k') }

  context 'default' do
    it { should contain_package('r10k').with(
      :ensure   => 'present',
      :provider => 'gem'
    ) }
  end

  context 'absent' do
    let(:params) { { :ensure => 'absent' } }
    it { should contain_package('r10k').with_ensure('absent') }
  end

  context 'package' do
    let(:params) { { :package_name => 'rubygem-r10k' } }
    it { should contain_package('rubygem-r10k') }
  end

  context 'provider' do
    let(:params) { { :provider => 'rpm' } }
    it { should contain_package('r10k').with_provider('rpm') }
  end

end
