RSpec.describe Yadisk::Client::Resources::V1::Disk do
  subject { described_class.new(client, parent) }
  let(:parent) { Yadisk::Client::Resources::V1.new(client) }
  let(:client) { Yadisk::Client.default }
  before do
    Yadisk::Client.configure do |c|
      c.oauth_token = 'token123'
    end


  end

  after do
    Yadisk::Client.instance_eval do
      @_configuration = nil
    end
  end

  it "#path" do
    expect(subject.path).to eq('disk')
  end

  it "#paths" do
    expect(subject.paths).to match_array(['v1', 'disk'])
  end

  it "#to_url" do
    expect(subject.to_url).to eq('https://cloud-api.yandex.net/v1/disk')
  end

  xit "#info" do
    expect(subject.info).to be_a(Yadisk::Client::Response)
  end
end
