class ConnectionsController < ApplicationController
  def index
    render json: Connection.all
  end
end
