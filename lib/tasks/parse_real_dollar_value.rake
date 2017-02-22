require 'open-uri'
require 'nokogiri'

desc 'get the dollar from rbc'
task get_the_dollar: :environment do
  page = Nokogiri::HTML(open("http://www.mk.ru/economics/"))
  value = page.css("div.finance-indexes div.finance-item")[0].css("div.finance-price").text
  Dollar.instance.update(real_value: value.to_f)
end
