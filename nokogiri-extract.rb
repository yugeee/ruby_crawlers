# coding: utf-8
require 'open-uri'
require 'nokogiri'

html = open('https://blog.takuros.net/entry/20140104/1388788175').read

doc = Nokogiri::HTML(html)
puts doc.xpath("//div[@class='entry-content']").text
