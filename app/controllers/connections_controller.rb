class ConnectionsController < ApplicationController
  def index
    @character = Character.find(params[:character_id])
    render json: @character.connections
  end
end
