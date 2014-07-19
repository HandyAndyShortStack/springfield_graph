class CharactersController < ApplicationController
  def index
    render json: Character.all
  end
end
