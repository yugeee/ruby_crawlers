# coding: utf-8
require 'nokogiri'
require 'open-uri'

url = 'http://www.yahoo.co.jp'

doc = Nokogiri::HTML(open(url))

title = doc.xpath('/html/head/title')
title = doc.css('title')
objects = doc.xpath('//a')

puts title
puts objects
