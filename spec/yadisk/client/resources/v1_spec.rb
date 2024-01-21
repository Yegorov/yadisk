RSpec.describe Yadisk::Client::Resources::V1 do
  subject { described_class.new(client) }
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

  it "#base_url" do
    expect(subject.base_url).to eq(Yadisk::Client::Resources::V1::BASE_URL)
  end

  it "#path" do
    expect(subject.path).to eq('v1')
  end

  it "#paths" do
    expect(subject.paths).to match_array(['v1'])
  end

  it "#to_url" do
    expect(subject.to_url).to eq('https://cloud-api.yandex.net/v1')
  end

  it "#disk" do
    expect(subject.disk).to be_a(Yadisk::Client::Resources::V1::Disk)
  end
end
