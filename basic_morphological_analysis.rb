# coding: utf-8
require 'rexml/document'
require 'open-uri'

APP_ID = 'XXXXXXXXXXXXXXXXX-'
BASE_URL = 'https://jlp.yahooapis.jp/MAService/V1/parse'

def request(text)
  app_id = APP_ID
  params = "?appid=#{app_id}&results=uniq&filter=9&uniq_filter=9"
  url = "#{BASE_URL}#{params}"+"&sentence="+URI.encode("#{text}")
  response = open(url)
  doc = REXML::Document.new(response).elements['ResultSet/uniq_result/word_list/']
  doc.elements.each('word'){|element|
    text = element.elements["surface"][0]
    count = element.elements["count"][0]
    puts "#{text}=#{count}"
  }
end

text = "隣の客はよく柿食う客だ"
request(text)
