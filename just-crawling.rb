# coding: utf-8
require 'anemone'

# urlは配列
urls = [
  'https://www.amazon.co.jp/gp/bestsellers/books/',
  'https://www.amazon.co.jp/gp/bestsellers/digital-text/2275256051/'
]

# urlに対してクローリング 深さは1ページ、クエリストリングはスキップ
Anemone.crawl(urls, depth_limit: 1, skip_query_strings: true) do |anemone|
  anemone.focus_crawl do |page|
    # /gp/bestsellers/books /gp/bestsellers/digital-text/2275256051 配下のリンクを1ページまで取得（カテゴリのランキングページまで）
    page.links.keep_if { |link|
      link.to_s.match(/\/gp\/bestsellers\/books|\/gp\/bestsellers\/digital-text/)
    }
  end

  PATTERN = %r[466298\/+|571582\/+|2292095051\/+|2291657051\/+]
  anemone.on_pages_like(PATTERN) do |page|
    puts page.url
  end

  # 取ってきた全ページのURLを出力
  #anemone.on_every_page do |page|
  #  puts page.url
  #end
end
