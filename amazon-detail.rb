# coding: utf-8
require 'open-uri'
require 'nokogiri'

asin = '4873111870'

url = "https://www.amazon.co.jp/dp/#{asin}"

doc = Nokogiri::HTML(open(url))

# タイトル
puts doc.xpath("//div[@id='booksTitle']/div[@class='a-section a-spacing-none']/h1/span[1]").text

# 価格
puts doc.xpath("//div[@id='tmmSwatches']/ul/li/span/span/span/a/span/span").text

# 画像URL
puts doc.xpath("//div[@id='img-canvas']/img").attribute('src').text
