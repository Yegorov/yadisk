require 'yadisk'

RSpec.describe Yadisk::Main do
  let(:yadisk) { Yadisk::Main.new }
  let(:file_name) { "./spec/files/Обои для рабочего стола.jpg" }

  it "has download method" do
    expect(yadisk).to respond_to(:download)
  end

  it "must download file" do
    yadisk.download("https://yadi.sk/i/HEjuI2Ln3RiRcQ", folder: "./spec/files/")
    expect(Pathname.new(file_name)).to be_exist
    File.delete(file_name)
  end
end
