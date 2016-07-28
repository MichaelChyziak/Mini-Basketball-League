class MapsController < ApplicationController
  # TO DO: Make new & create only accessible by admin
  before_action :admin_user,     only: [:new, :create]
  def index
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to maps_path
    else
      render 'new'
    end
  end

  private

  def map_params
    params.require(:map).permit(:name, :info, :lat,
                                 :lng, :league)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(maps_path) unless current_user.admin?
  end

end
