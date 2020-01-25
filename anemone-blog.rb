# coding: utf-8
require 'anemone'
require 'open-uri'

urls = ['http://blog.livedoor.jp/dqnplus/']

opts = {
  depth_limit: false,
  delay: 1
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.focus_crawl do |page|
    page.links.keep_if {|link|
      link.to_s.match(/blog.livedoor.jp\/dqnplus\/archives\/(\d+)\.html/)
    }
  end

  anemone.on_every_page do |page|
    puts page.url
  end
end
