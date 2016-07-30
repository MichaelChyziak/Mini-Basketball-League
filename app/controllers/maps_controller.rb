class MapsController < ApplicationController
  # TO DO: Make new & create only accessible by admin
  before_action :admin_user,     only: [:new, :create]
  def index
    @maps = Map.all
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

  def show
    @maps = Map.all
  end

  def save_primary
    current_user.update_attribute(:primary_court, params[:court])
    flash[:success] = "Successfully updated Primary Court"
    redirect_to "/show"
  end

  def save_secondary
    current_user.update_attribute(:secondary_court, params[:court])
    flash[:success] = "Successfully updated Secondary Court"
    redirect_to "/show"
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
