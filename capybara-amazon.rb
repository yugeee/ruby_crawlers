# coding: utf-8
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.current_driver = :selenium_chrome
Capybara.app_host = 'https://affiliate.amazon.co.jp/'
Capybara.default_max_wait_time = 5

AMAZON_EMAIL = 'XXXXXXXXXXXXXXXXX@gmail.com'
AMAZON_PASSWORD = 'XXXXXXXXXXXXXXXXX'

module Crawler
  class Amazon
    include Capybara::DSL

    def login
      visit('/signin')
      fill_in "email", with: AMAZON_EMAIL
      fill_in "password", with: AMAZON_PASSWORD
      click_on "signInSubmit"
    end

    def portal
      visit('home')
      click_link("レポートの詳細をみる")
    end

    def report
      puts "クリック数" + find_by_id('ac-report-earning-commision-clicks').text
      puts "注文済み商品" + find_by_id('ac-report-earning-commision-ordered').text
      puts "紹介料" + find_by_id('ac-report-earning-commision-total').text
    end
  end
end

crawler = Crawler::Amazon.new
crawler.login
crawler.portal
crawler.report
