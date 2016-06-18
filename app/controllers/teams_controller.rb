class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # Used to approve a team and return back to the teams index page
  def approve
    @team = Team.find(params[:id])
    @team.update_attributes(:status => "approved")
    redirect_to "/teams"
  end

  #Used to decline a team and return back to the teams index page
  def decline
    @team = Team.find(params[:id])
    @team.update_attributes(:status => "declined")
    redirect_to "/teams"
  end

  # Used for a user wishing to join a specific team
  def join_team
    @user = User.find(current_user)
    @team = Team.find(params[:id])
    @team.players_id << @user.id unless @team.players_id.include?(@user.id)
    @team.save
    redirect_to action: "show"
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
    @teams = Team.all
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
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
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
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:team_name, :league, :players_id, :status, :logo)
    end

    def home

    end

    def profile

    end

    def about

    end
end
