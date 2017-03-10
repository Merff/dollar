module GetDollarService
  require 'open-uri'
  require 'nokogiri'

  module_function

  def execute
    page = Nokogiri::HTML(open("http://www.mk.ru/economics/"))
    value = page.css("div.finance-indexes div.finance-item")[0].css("div.finance-price").text
    Dollar.instance.update(real_value: value.to_f)
  end

end