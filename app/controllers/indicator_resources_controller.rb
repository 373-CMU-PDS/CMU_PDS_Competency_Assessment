class IndicatorResourcesController < ApplicationController
  before_action :set_indicator_resource, only: [:show, :edit, :update, :destroy]
  before_action :check_authentication

  # GET /indicator_resources
  # GET /indicator_resources.json
  def index
    @indicator_resources = IndicatorResource.all
  end

  # GET /indicator_resources/1
  # GET /indicator_resources/1.json
  def show
  end

  # GET /indicator_resources/new
  def new
    @indicator_resource = IndicatorResource.new
  end

  # GET /indicator_resources/1/edit
  def edit
  end

  # POST /indicator_resources
  # POST /indicator_resources.json
  def create
    @indicator_resource = IndicatorResource.new(indicator_resource_params)

    respond_to do |format|
      if @indicator_resource.save
        format.html { redirect_to @indicator_resource, notice: 'Indicator resource was successfully created.' }
        format.json { render action: 'show', status: :created, location: @indicator_resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @indicator_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicator_resources/1
  # PATCH/PUT /indicator_resources/1.json
  def update
    respond_to do |format|
      if @indicator_resource.update(indicator_resource_params)
        format.html { redirect_to @indicator_resource, notice: 'Indicator resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @indicator_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicator_resources/1
  # DELETE /indicator_resources/1.json
  def destroy
    @indicator_resource.destroy
    respond_to do |format|
      format.html { redirect_to indicator_resources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator_resource
      @indicator_resource = IndicatorResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_resource_params
      params.require(:indicator_resource).permit(:indicator_id, :resource_id)
    end
end
