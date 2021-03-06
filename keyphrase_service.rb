# coding: utf-8
require 'rexml/document'
require 'open-uri'
require 'nokogiri'

APP_ID = 'XXXXXXXXXXXXXXXXX-'
BASE_URL = 'https://jlp.yahooapis.jp/KeyphraseService/V1/extract'

$word_list = Hash::new

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
    $word_list["#{text}"] = $word_list["#{text}"].nil? ? 1 : $word_list["#{text}"]+1
  }
end

def get_urls(page_url)
  urls = Array.new()
  url = URI.parse(page_url)
  doc = Nokogiri::HTML(open(page_url))
  doc.xpath("//*[@id='main']//ul[@class='list']//a").each do |anchor|
    url = anchor[:href]
    url = uri.merge(url) if not url =~ /^http/
    urls << url
  end
  return urls
end

def get_headline_text(page_url)
  text = ""
  doc = Nokogiri::HTML(open(page_url))
  if page_url.to_s.match(/dailynews/)
    text = doc.xpath("//*[@id='detailHeadline']").text
  else
    text = doc.xpath("//*[@id='main']//p[@class='hbody']").text
  end
  return text.gsub(/\n/, "")
end

def get(page_url)
  urls = get_urls(page_url)
  puts urls
  urls.each {|url|
    text = get_headline_text(url)
    request(text)
  }
end
page_url = "https://news.yahoo.co.jp/list/?c=economy"
get(page_url)
$word_list.each{ |key, value|
  puts "#{key}=#{value}"
}
