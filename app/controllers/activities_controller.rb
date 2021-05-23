class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = Activity.where(team_id: params[:team_id]).all
	@team = params[:team_id]
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
	@team = params[:team_id]
	@activities = Activity.where(team_id: @team)
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)
	@team = @activity.team_id

    respond_to do |format|
      if @activity.save
        format.html { redirect_to write_activity_path(@team), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:team_id, :user_id, :title, :research, :ppt, :script, :attachment)
    end
end
