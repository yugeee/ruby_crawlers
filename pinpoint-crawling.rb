require 'anemone'

urls = []

urls << "https://www.amazon.co.jp/gp/bestsellers/books/466298/"
urls << "https://www.amazon.co.jp/gp/bestsellers/books/571582/"
urls << "https://www.amazon.co.jp/gp/bestsellers/digital-text/2275256051/"
urls << "https://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/"

Anemone.crawl(urls, depth_limit: 0) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
  end
end
