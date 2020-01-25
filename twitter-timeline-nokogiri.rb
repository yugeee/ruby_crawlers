# coding: utf-8
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open('https://twitter.com/TwitterJP'))
doc.xpath("//div[@id='timeline']/div/div[@class='stream']/ol/li").each {|tweet|
  # tweet time
  puts Time.at(tweet.xpath("./div[1]/div[@class='content']/div[1]/small[@class='time']/a/span").attribute('data-time').value.to_i)

  # tweet body
  puts tweet.xpath("./div[1]/div[@class='content']/div[2]/p").text

  # retweet count
  puts tweet.xpath("./div[1]/div[@class='content']/div[4]/div[2]/div/button[@class='ProfileTweet-actionButtonUndo js-actionButton js-actionRetweet']/span/span").text

  # iine count
  puts tweet.xpath("./div[1]/div[@class='content']/div[4]/div[2]/div/button[@class='ProfileTweet-actionButton js-actionButton js-actionFavorite']/span/span").text
}

