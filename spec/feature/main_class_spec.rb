RSpec.describe Yadisk::Main do
  it "#download" do
    yadisk = Yadisk::Main.new
    expect(yadisk).to respond_to(:download)
  end
end
