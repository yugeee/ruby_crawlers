# coding: utf-8
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'multi_json'
require 'autopagerize'

Capybara.current_driver = :selenium_chrome
Capybara.app_host = 'https://www.amazon.co.jp/s/ref=nb_sb_noss?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&url=search-alias%3Dstripbooks&field-keywords=%E3%83%89%E3%82%A5%E3%83%AB%E3%83%BC%E3%82%BA'
Capybara.default_max_wait_time = 20

module Crawler
  class LinkChecker
    include Capybara::DSL

    def initialize
      visit('')
      url = Capybara.app_host
      siteinfo = MultiJson.load(
        File.read('siteinfo.json')
      )
      @page = Autopagerize.new(url, siteinfo)
    end

    def get_nextlink
      page_number = 1
      @page.each do |page|
        visit(page.nextlink)
        save_screenshot("screenshot#{page_number}.png")
        page_number += 1
      end
    end
  end
end

crawler = Crawler::LinkChecker.new
crawler.get_nextlink
