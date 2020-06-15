class HikesController < ApplicationController

  def index
    hikes = Hike.all
    render json: hikes, except: [:created_at, :updated_at]
  end

end
