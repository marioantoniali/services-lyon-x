require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap
  attr_accessor :address

  def initialize(address = "https://coinmarketcap.com/all/views/all/")
    @address = address
  end

  def perform
    page = Nokogiri::HTML(open(@address))
      crypto_name = page.css('a.currency-name-container').map { |crypto| crypto.text }
      crypto_price = page.css('a.price').map { |price| price.text }

    my_hash = crypto_name.zip(crypto_price)

    puts my_hash
  end

  def save

  end
end
