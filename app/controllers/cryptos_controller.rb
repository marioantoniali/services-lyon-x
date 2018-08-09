class CryptosController < ApplicationController
  # Méthode si on souhaite utiliser un text-field pour la recherche
  def index
    @search = params[:search]
    @cryptos = Crypto.find_by(name: @search)
  end
end
