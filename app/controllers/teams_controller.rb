class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]


  #Allows users to leave their team
  def leave_team
    if current_user.team_id != -1
      @team = Team.find(current_user.team_id)
      @team.players_id.delete(current_user.id)
      current_user.update_attribute(:team_id, -1)
      @team.save
      current_user.save
      flash[:warning] = "You have left this team."
    end
    redirect_to action: "show"
  end


  # Used to approve a team and return back to the teams index page
  def approve
    @team = Team.find(params[:id])
    league_chosen = @team.league
    approved_count = 0
    Team.find_each do |team|
      if team.league == league_chosen && team.status == "approved"
        approved_count = approved_count + 1
      end
    end
    if current_user.admin? && @team.status == "pending" && approved_count < 8 #allow only admin to do this and if the team is pending and less than 8 teams are in the league
      @team.update_attributes(:status => "approved")
      redirect_to "/teams"
    elsif approved_count >= 8
      redirect_to "/teams"
      flash[:warning] = "The maximum of 8 teams already exist in that league."
    else
      redirect_to "/home"
      flash[:warning] = "That action cannot be done."
    end
  end

  #Used to decline a team and return back to the teams index page
  def decline
    @team = Team.find(params[:id])
    if current_user.admin? && @team.status == "pending" #allow only admin to do this and if the team is pending
      @team.update_attributes(:status => "declined")
      redirect_to "/teams"
    else
      redirect_to "/home"
      flash[:warning] = "That action cannot be done."
    end
  end

  # Used for a user wishing to join a specific team. Must be approved by team captain later to actually join team
  def join_team
    @team = Team.find(params[:id])
    if current_user.team_id == -1 && @team.applied_user_ids.exclude?(current_user.id)
      @team.applied_user_ids << current_user.id
      @team.save
      current_user.pending_team_ids << @team.id
      current_user.save
      redirect_to action: "show"
      flash[:warning] = "You have successfully applied for this team."
    elsif current_user.team_id != -1
      redirect_to action: "show"
      flash[:warning] = "You could not apply for this team since you are currently on a team."
    else
      redirect_to action: "show"
      flash[:warning] = "You have already applied to this team."
    end
  end

  #For the captains_view page (only for the captain of the team)
  def captain_team
    @team = Team.find(params[:id])
    if @team.captain_id == current_user.id
      #TODO
    else
      redirect_to "/home"
      flash[:warning] = "Only team captains can access that page."
    end
  end

  #Used to decline a team and return back to the teams index page
  def appoint_captain
    @team = Team.find(params[:team_id])
    if current_user.id == @team.captain_id #only allow the captain to appoint another user as the captain
      @team.update_attribute(:captain_id, params[:player_id].to_i)
      redirect_to action: "show"
      flash[:warning] = "Successfully appointed another user as the team captain. You are no longer the team captain."
    else
      redirect_to "/home"
      flash[:warning] = "Only the team's captain can do that action."
    end
  end

  #Used to decline a team and return back to the teams index page
  def remove_user
    @team = Team.find(params[:team_id])
    if current_user.id == @team.captain_id #allow only captian to remove a user from the team
      if (params[:player_id] != current_user.id)
        @team.players_id.delete(params[:player_id].to_i)
        @team.save
        User.find(params[:player_id]).update_attribute(:team_id, -1)
        redirect_to action: "captain_team"
        flash[:warning] = "Successfully removed user from team."
      else
        redirect_to action: "captain_team"
        flash[:warning] = "Cannot remove yourself from the team."
      end
    else
      redirect_to "/home"
      flash[:warning] = "Only the team's captain can do that action."
    end
  end


  #Used by the team captain to accept users wanting to join the team
  def accept_user
    @team = Team.find(params[:id])
    user = User.find(params[:player_id])
    if @team.captain_id == current_user.id && user.team_id == -1
      @team.applied_user_ids.delete(params[:player_id].to_i)
      @team.players_id << params[:player_id]
      @team.save
      user.update_attribute(:team_id, @team.id)
      user.save
      redirect_to action: "show"
      flash[:warning] = "Accepted user to team."
    elsif user.team_id != -1
      @team.applied_user_ids.delete(params[:player_id].to_i)
      @team.save
      redirect_to action: "show"
      flash[:warning] = "User has already joined a team. Could not add user to team."
    else
      redirect_to action: "home"
      flash[:warning] = "Only the team captains can perform that action."
    end
  end

  #Used by the team captain to decline users wanting to join the team
  def decline_user
    @team = Team.find(params[:id])
    if @team.captain_id == current_user.id
      @team.applied_user_ids.delete(params[:player_id].to_i)
      @team.save
      redirect_to action: "show"
      flash[:warning] = "Declined user from team."
    else
      redirect_to action: "home"
      flash[:warning] = "Only team captains can do that."
    end
  end

  #REMOVE? Seems to not be used
  def find_users_team
    @team = Team.find(params[team_id])
    redirect_to @team
  end


  # GET /teams/join
  # Used for all users if they wish to join a team
  def join
    @teams = Team.all
  end

  # GET /teams
  # GET /teams.json
  # Only admin can go to this page
  def index
    if current_user.admin?
      @teams = Team.all
    else
      redirect_to "/home"
      flash[:warning] = "Only admins can access that page."
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    if current_user.admin? || @team.captain_id == current_user.id
      #continue as normal if admin or captain of the team
    else
      redirect_to "/home"
      flash[:warning] = "Only admins can access that page."
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    #Creating a team only if you aren't on one already and you join it automatically, also make person captain of the team
    if current_user.team_id == -1
      @team = Team.new(team_params)
      @team.players_id << current_user.id
      @team.captain_id = current_user.id
      @team.save
      current_user.update_attribute(:team_id, @team.id)
      current_user.save
      respond_to do |format|
        if @team.save
          format.html { redirect_to @team, warning: "You have successfully created and joined this team." }
          format.json { render :show, status: :created, location: @team }
        else
          format.html { render :new }
          format.json { render json: @team.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to home_path
      flash[:warning] = "You could not create a team since you are currently in a team."
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, warning: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    #Remove the team from each user who was a part of it
    if current_user.admin?
      @team.players_id.each do |player_id|
        user = User.find(player_id)
        user.update_attribute(:team_id, -1)
      end
      @team.destroy
      redirect_to teams_url
      flash[:warning] = 'Team was successfully destroyed.'
    elsif @team.captain_id == current_user.id
      @team.players_id.each do |player_id|
        user = User.find(player_id)
        user.update_attribute(:team_id, -1)
      end
      @team.destroy
      redirect_to home_path
      flash[:warning] = 'Team was successfully destroyed.'
    else
      redirect_to "/home"
      flash[:warning] = "Only admins can access that page."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:team_name, :league, :players_id, :status, :logo, :team_message)
    end

    def home

    end

    def profile

    end

    def about

    end


end
