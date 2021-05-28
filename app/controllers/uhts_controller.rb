class UhtsController < ApplicationController
  before_action :set_uht, only: %i[ show edit update destroy ]

  # GET /uhts or /uhts.json
  def index
    @uhts = Uht.all
	@team = Team.find(params[:team_id])
	@uht = Uht.where(team_id: @team)
	@admin = Admin.where(team_id: @team)
  end

  # GET /uhts/1 or /uhts/1.json
  def show
  end

  # GET /uhts/new
  def new
    @uht = Uht.new
  end

  # GET /uhts/1/edit
  def edit
  end

  # POST /uhts or /uhts.json
  def create
    @uht = Uht.new(uht_params)
	@team_id = @uht.team_id

    respond_to do |format|
      if @uht.save
        format.html { redirect_to team_path(@team_id), notice: "Uht was successfully created." }
        format.json { render :show, status: :created, location: @uht }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @uht.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uhts/1 or /uhts/1.json
  def update
    respond_to do |format|
      if @uht.update(uht_params)
        format.html { redirect_to @uht, notice: "Uht was successfully updated." }
        format.json { render :show, status: :ok, location: @uht }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @uht.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uhts/1 or /uhts/1.json
  def destroy
    @uht.destroy
	@team_id = @uht.team_id
	  
    respond_to do |format|
      format.html { redirect_to members_path(@team_id), notice: "Uht was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uht
      @uht = Uht.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def uht_params
      params.require(:uht).permit(:user_id, :team_id)
    end
end
