class CharactersController < ApplicationController
  def index
    render json: Character.all.to_json
  end
end
