# coding: utf-8
require 'nokogiri'
require 'open-uri'

url = 'https://ja.wikipedia.org/w/api.php?hidebots=1&hidecategorization=1&hideWikibase=1&urlversion=1&days=7&limit=50&action=feedrecentchanges&feedformat=atom'
xml = open(url).read

doc = Nokogiri::XML(xml)

entries = doc.css('entry')

entries.each {|entry|

  puts entry.css('title').text
  puts entry.css('author/name').text
}
