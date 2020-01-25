# coding: utf-8
require 'rexml/document'
require 'open-uri'

APP_ID = 'XXXXXXXXXXXXXXXXX'
BASE_URL = 'https://jlp.yahooapis.jp/KeyphraseService/V1/extract'

def request(text)
  app_id = APP_ID
  params = "?appid=#{app_id}&output=xml"
  url = "#{BASE_URL}#{params}"+"&sentence="+URI.encode("#{text}")
  response = open(url)
  doc = REXML::Document.new(response).elements['ResultSet/']
  doc.elements.each('Result'){|element|
    text = element.elements["Keyphrase"][0]
    score = element.elements["Score"][0]
    puts "#{text}=#{score}"
  }
end

text = "隣の客はよく柿食う客だ"
request(text)
