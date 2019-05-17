require 'uri'
require 'open-uri'
require 'nokogiri'

module ProphecyHelper
  def yandex_prophecy(request)
    # https://www.bing.com/images/search?q=
    doc = Nokogiri::HTML(open("https://yandex.ru/images/search?text=#{URI.encode(request)}", 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2'))
    doc = doc.css('img.serp-item__thumb').to_a.sample
    doc.present? ? doc.attr('src') : image_path('empty-logo.jpg')
  end

  def bing_prophecy(request)
    doc = Nokogiri::HTML(open("https://www.bing.com/images/search?q=#{URI.encode(request)}", 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2'))
    doc = doc.css('img.mimg.rms_img').to_a.sample
    doc.present? ? doc.attr('src') : image_path('empty-logo.jpg')
  end
end
