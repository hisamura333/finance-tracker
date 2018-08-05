class Stock < ApplicationRecord

  def self.new_form_lookup(ticker_sysbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_sysbol)
      price = strip_commas(looked_up_stock.latest_price)
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end

  def self.strip_commas(number)
    number.to_s.gsub(",","")

  end
end
