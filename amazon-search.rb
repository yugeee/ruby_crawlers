# coding: utf-8
require 'open-uri'
require 'nokogiri'
require 'uri'

search_word = URI.escape('クローラ')
url = "https://www.amazon.co.jp/s/ref=nb_sb_noss_2?&url=search-alias%3Dstripbooks&field-keywords=#{search_word}"

doc = Nokogiri::HTML(open(url))

doc.xpath("//ul[@id='s-results-list-atf']/li").each {|item|
  puts item.attribute('data-asin').text
}
