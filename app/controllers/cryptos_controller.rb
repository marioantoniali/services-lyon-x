class CryptosController < ApplicationController
  # Méthode si on souhaite utiliser un text-field pour la recherche
  def index
    @cryptos = (params[:search].nil?) ? nil : Crypto.find(params[:search])
  end

  def load
    StartScrap.new.perform
  end
end
