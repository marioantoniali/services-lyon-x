class CryptosController < ApplicationController
  def index
    @search = params[:search]
    @cryptos = Crypto.find_by(name: @search)
  end
end
