# coding: utf-8
require 'anemone'
require 'nokogiri'
require 'kconv'

urls = []

urls << "https://www.amazon.co.jp/gp/bestsellers/books/466298/"
urls << "https://www.amazon.co.jp/gp/bestsellers/books/571582/"
urls << "https://www.amazon.co.jp/gp/bestsellers/digital-text/2292103051/"
urls << "https://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/"

Anemone.crawl(urls, depth_limit: 0) do |anemone|
  anemone.on_every_page do |page|

    doc = Nokogiri::HTML.parse(page.body.toutf8.strip)
    
    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text

    sub_category = doc.xpath("//*[@id=\'zg_listTitle\']/span").text

    puts category+ "/" + sub_category

    # 一般・Kindle有料
    items = doc.css(".zg_itemRow")
    # kindle無料
    #items += doc.xpath("//div[@class=\"zg_itemRow\"]/div[2]/div[2]")
    
    items.each{|item|

      if item.nil?
        next
      end
      
      # 順位
      puts item.css(".zg_rankNumber")[0].text
      
      # 書籍名
      puts item.css("img").attribute("alt").text

      # ASIN
      puts item.css('a').attribute("href").text.match(%r{dp/(.+?)/})[1]

      unless item.css(".zg_rankNumber")[1].nil?
        # 順位
        puts item.css(".zg_rankNumber")[1].text
        
        # 書籍名
        puts item.css("img")[1].attribute("alt").text
        
        # ASIN
        puts item.css('a')[1].attribute("href").text.match(%r{dp/(.+?)/})[1]
      end
      
    }
  end
end

