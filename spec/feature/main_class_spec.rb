require 'yadisk/main'

RSpec.describe Yadisk::Main do
  let(:yadisk) { Yadisk::Main.new }

  it "has download method" do
    expect(yadisk).to respond_to(:download)
  end

  describe 'download file from yandex' do
    let(:download_url) { "https://yadi.sk/i/HEjuI2Ln3RiRcQ" }
    let(:download_file) { |e| Pathname.new(e.metadata[:download_file]) }
    let(:folder) { download_file.dirname.to_s }

    it "must download and save file", download_file: "./spec/files/Обои для рабочего стола.jpg" do
      yadisk.download(download_url, folder: folder)
      expect(Pathname.new(download_file)).to be_exist
    end
  end
end
