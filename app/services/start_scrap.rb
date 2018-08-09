require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap
  attr_accessor :address

  def initialize(address = "https://coinmarketcap.com/all/views/all/")
    @address = address
  end

  # Méthode qui exécute les actions
  def perform
    scrap_crypto
    save
  end

  # Méthode pour scraper notre page web de cryptomonnaies
  def scrap_crypto
    page = Nokogiri::HTML(open(@address))
      crypto_name = page.css('a.currency-name-container').map { |crypto| crypto.text }
      crypto_price = page.css('a.price').map { |price| price.text }

    @my_hash = crypto_name.zip(crypto_price)
  end

  # Méthode pour enregistrer les résultats du scraping dans notre BDD SQlite3
  def save
    @my_hash.each { |name, price| Crypto.create(name: name, value: price) } # On applique la méthode create sur notre model Crypto pour enregistrement en BDD (le model fait le lien)
  end
end
