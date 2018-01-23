require 'yadisk'

RSpec.describe Yadisk::Main do
  let(:yadisk) { Yadisk::Main.new }

  it "has download method" do
    expect(yadisk).to respond_to(:download)
  end

  it "must download file" do
    yadisk.download("https://yadi.sk/i/HEjuI2Ln3RiRcQ", folder: "./spec/files/")
    expect(File.exists?("./spec/files/Обои для рабочего стола.jpg")).to be true
  end
end
