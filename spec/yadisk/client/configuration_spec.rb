RSpec.describe Yadisk::Client::Configuration do
  let(:oauth_token) { 'token123' }
  subject { described_class.new }

  it "has empty oauth_token" do
    expect(subject.oauth_token).to be_nil
  end

  context "initialize with .new" do
    subject { described_class.new(oauth_token: oauth_token) }

    it "has oauth_token" do
      expect(subject.oauth_token).to eq(oauth_token)
    end
  end

  context "initialize with .build method" do
    subject do
      described_class.build do |c|
        c.oauth_token = oauth_token
      end
    end

    it "has oauth_token" do
      expect(subject.oauth_token).to eq(oauth_token)
    end
  end
end
