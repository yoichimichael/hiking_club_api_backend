class MembersController < ApplicationController

  def index
    members = Member.all
    render json: members, except: [:created_at, :updated_at]
  end

end
