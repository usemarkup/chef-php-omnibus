describe package('php71u-cli') do
  it { should be_installed }
  its('version') { should >= '7.1.0' }
  its('version') { should < '7.2.0' }
end

describe package('php71u-fpm') do
  it { should be_installed }
end

describe service('php-fpm') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe 'runtime is available' do
  it 'has php' do
    expect(command('php -v').exit_status).to eq(0)
  end
end

describe 'php has opcache.max_accelerated_files set to 25000' do
  it 'has php' do
    expect(command('php -i | grep "opcache.max_accelerated_files => 25000 => 25000"').exit_status).to eq(0)
  end
end
