RSpec.describe Yadisk::Client do
  let(:default_client) { described_class.default }

  it "has configure method" do
    expect(described_class).to respond_to(:configure)
  end

  it "not empty config" do
    expect(default_client.config).not_to be_nil
  end

  it "has empty oauth_token" do
    expect(default_client.config.oauth_token).to be_nil
  end

  describe 'with default config' do
    let(:oauth_token) { 'y0_AgAAAAA' }
    before do
      described_class.configure do |c|
        c.oauth_token = oauth_token
      end
    end
    after do
      Yadisk::Client.instance_eval do
        @_configuration = nil
      end
    end

    it "default client has correct oauth_token" do
      expect(default_client.config.oauth_token).to eq(oauth_token)
    end
  end

  describe "with custom config" do
    let(:config1) { Yadisk::Client::Configuration.new(oauth_token: 'oauth_token1') }
    let(:config2) { Yadisk::Client::Configuration.new(oauth_token: 'oauth_token2') }

    let(:client1) { described_class.new(config1) }
    let(:client2) { described_class.new(config2) }

    it "client1 and client2 has different oauth tokens" do
      expect(client1.config.oauth_token).not_to eq(client2.config.oauth_token)
    end
  end

  it "has v1 method" do
    expect(default_client).to respond_to(:v1)
    expect(default_client.v1).to be_a(Yadisk::Client::Resources::Resource)
  end
end
