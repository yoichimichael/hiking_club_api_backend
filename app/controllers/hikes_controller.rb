class HikesController < ApplicationController

  def index
    hikes = Hike.all
    render json: hikes.to_json(:include => {
      :members => {:only => [:name, :username,:img_url,:email]},
      :host => {:only => [:name,:username,:email,:img_url]},
      :comments => {:only => [:content]}
    }, :except => [:created_at,:updated_at])
    
  end

  def show
    hike = Hike.find(params[:id])
    render json: hike.to_json(:include => {
      :members => {:only => [:name, :username,:img_url,:email]},
      :host => {:only => [:name,:username,:email,:img_url]},
      :comments => {:only => [:content]}
    }, :except => [:created_at,:updated_at])
  end

  def create
    hike = Hike.new(hike_params)
    hike.save
    render json: hike.to_json(:include => {
      :members => {:only => [:name, :username,:img_url,:email]},
      :host => {:only => [:name,:username,:email,:img_url]},
      :comments => {:only => [:content]}
    }, :except => [:created_at,:updated_at])
  end

  def update
    hike = Hike.find(params[:id])
    hike.update(hike_params)
    render json: hike.to_json(:include => {
      :members => {:only => [:name, :username,:img_url,:email]},
      :host => {:only => [:name,:username,:email,:img_url]},
      :comments => {:only => [:content]}
    }, :except => [:created_at,:updated_at])
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
