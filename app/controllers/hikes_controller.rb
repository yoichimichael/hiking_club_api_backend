class HikesController < ApplicationController

  def index
    hikes = Hike.all
    render json: hikes, except: [:created_at, :updated_at]
  end

  def show
    hike = Hike.find(params[:id])
    render json: hike, except: [:created_at, :updated_at]
  end

  def create
    hike = Hike.new(hike_params)
    hike.save
    render json: hike, except: [:created_at, :updated_at]
  end

  def update
    hike = Hike.find(params[:id])
    hike.update(post_params)
    render json: hike, except: [:created_at, :updated_at]
  end

  def delete
    hike = Hike.find(params[:id])
    hike.destroy
  end

  private
 
  def hike_params
    params.require(:hike).permit(:location, :distance, :duration, :description, :img_url, :host_id, :start_at)
  end


end
