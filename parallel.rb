# coding: utf-8
require 'parallel'
require 'nokogiri'
require 'open-uri'

urls = []

urls << 'https://www.amazon.co.jp/gp/bestsellers/books/466298'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/492116'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/500102'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/492236'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/466290'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/492334'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/492352'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/500074/'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/500090'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/500098'
urls << 'https://www.amazon.co.jp/gp/bestsellers/books/562848'

Parallel.each(urls, in_threads: 10) {|url|
  doc = Nokogiri::HTML(open(url))
  puts doc.title
}

