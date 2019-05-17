require 'rails_helper'

describe ProphecyHelper, type: :helper do
  describe 'yandex prophecy' do
    it 'returns an image for provided request' do
      expect(helper.yandex_prophecy('Example request')).to be_url
    end
  end

  describe 'bing prophecy' do
    it 'returns an image for provided request' do
      expect(helper.bing_prophecy('Example request')).to be_url
    end
  end
end
