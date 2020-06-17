class MembersController < ApplicationController

  def index
    members = Member.all
    render json: members, except: [:created_at, :updated_at, :password_digest]
  end

  def show
    member = Member.find(params[:id])
    render json: member, except: [:created_at, :updated_at]
  end

  def create
    member = Member.new(member_params)
    member.save
    render json: member, except: [:created_at, :updated_at, :password_digest]
  end

  def update
    member = Member.find(params[:id])
    member.update(post_params)
    render json: member, except: [:created_at, :updated_at]
  end

  def delete
    member = Member.find(params[:id])
    member.destroy
  end

  private
 
  def member_params
    params.require(:member).permit(:name, :username, :email, :img_url)
  end

end
