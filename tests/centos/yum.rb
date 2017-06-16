describe yum.repo('ius') do
  it { should exist }
  it { should be_enabled }
end

describe yum.repo('epel') do
  it { should exist }
  it { should be_enabled }
end
