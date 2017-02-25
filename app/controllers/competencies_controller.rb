class CompetenciesController < ApplicationController

  before_action :set_competency, only: [:show, :edit, :update, :destroy]
  before_action :check_authentication

  # GET /competencies
  # GET /competencies.json
  def index
    @competencies = Competency.all
  end

  # GET /competencies/1
  # GET /competencies/1.json
  def show
    @indicators = @competency.indicators.alphabetical.to_a
    # The system uses the view_all flow to look at competencies in depth. When
    # 'showing' a competency, we redirect to the view_all flow of the chossen
    # competency.
    redirect_to view_all_level_step_path(competency_id: @competency.id)
  end

  # GET /competencies/new
  def new
    # session[:upload] is set to nil in case the user decides to use the upload
    # method.
    session[:upload] = nil
    session[:competency] = nil
    @competency = Competency.new
    if !notice.blank?
      @notice = notice
    end
  end

  # GET /competencies/1/edit
  def edit
  end

  # POST /competencies
  # POST /competencies.json
  def create
    # When creating a comptency, everything is saved in the session. Refer to
    # the competency_steps controller for more detailed information.
    session[:competency] = nil
    @competency = Competency.new(competency_params)
    session[:competency] = @competency.attributes
    redirect_to competency_steps_path
  end

  # PATCH/PUT /competencies/1
  # PATCH/PUT /competencies/1.json
  def update
    respond_to do |format|
      if @competency.update(competency_params)
        format.html { redirect_to @competency, notice: 'Competency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1
  # DELETE /competencies/1.json
  def destroy
    @competency.destroy
    respond_to do |format|
      format.html { redirect_to competencies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency
      @competency = Competency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_params
      params.require(:competency).permit(:name)
    end
end