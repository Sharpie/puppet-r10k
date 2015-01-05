require 'spec_helper'

describe 'r10k::config', :type => :class do
  let(:params){
    {
      'sources' => {
        'somename' => {
          'remote'  => 'ssh://git@github.com/someuser/somerepo.git',
          'basedir' => "${::settings::confdir}/environments"
        },
        'someothername' => {
          'remote'  => 'ssh://git@github.com/someuser/someotherrepo.git',
          'basedir' => '/some/other/basedir'
        },
      },
      'postrun' => ['/usr/bin/curl', '-F', 'deploy=done', 'http://my-app.site/endpoint'],
    }
  }

  it 'manages /etc/r10k.yaml' do
    expect(subject).to contain_file('/etc/r10k.yaml')
  end

  it 'creates valid YAML' do
    expect{ YAML.load subject.resource('File', '/etc/r10k.yaml')[:content]}.not_to raise_error
  end

  # These tests check that the template is properly concatenating multiple
  # YAML dumps of Ruby objects.
  context 'when generating content' do
    let(:content){ YAML.load subject.resource('File', '/etc/r10k.yaml')[:content] }

    it 'creates a hash of sources' do
      expect(content[:sources]).to be_a(Hash)
    end

    it 'creates the postrun command as an array' do
      expect(content[:postrun]).to be_a(Array)
    end
  end
end
