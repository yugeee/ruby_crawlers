# coding: utf-8
require 'anemone'

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

opts = {
  obey_robots_txt: true,
  thread: 10,
  depth_limit: 0
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    puts page.doc.xpath('//title/text()').to_s if page.doc
  end
end
