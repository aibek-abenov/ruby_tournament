class TeamsController < ApplicationController
  include TeamsHelper
  include TournamentsHelper
  include PlayoffsHelper
  include SemifinalsHelper
  include FinalsHelper

  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  def to_division
    teams = Team.all

    if (teams.count) == 16
      Divisions.new.into_division
      flash.now[:notice] = "Success"
      @divisions = Division.all
    else
      flash.now[:notice] = "Кол-во команд не корректна"
    end
  end

  def start_tournament
    DivisionStat.destroy_all
    PlayoffStat.destroy_all
    SemifinalStat.destroy_all
    FinalStat.destroy_all

    Tournament.new.final_eight
    Playoff.new.go_to_playoff
    Semifinals.new.go_to_semifinal
    Finals.new.go_to_final
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  def show_all_statistics
    @winner = FinalStat.where(is_winner: true)
  end

  def show_division_stat
    @division_stat = DivisionStat.all
  end

  def show_playoff_stat
    @playoff_stat = PlayoffStat.all
  end

  def show_semifinal_stat
    @semifinal_stat = SemifinalStat.all
  end

  def show_final_stat
    @final_stat = FinalStat.all
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name)
    end
end
