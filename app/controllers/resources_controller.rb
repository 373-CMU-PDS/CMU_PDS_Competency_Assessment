class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :check_authentication

  # The view for resources uses the Filteriffic gem. Refer to the resources
  # model for details.

  # GET /resources
  # GET /resources.json
  def index
    @filterrific = initialize_filterrific(
      Resource,
      params[:filterrific],
      select_options: {
        sort_active: Resource.options_for_sort_active,
        sort_by_competency: Competency.options_for_sort_by_competency,
        sort_by_level: Indicator.options_for_sort_by_level,
        sort_by_category: Resource.options_for_sort_by_category
      }
    ) or return

    @resources = Resource.filterrific_find(@filterrific).paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
    @resource_category_options = Resource.get_categories
  end

  # GET /resources/1/edit
  def edit
    @resource_category_options = Resource.get_categories
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end

  # This method is called when a user toggles the active state of a resource.
  # It redirects to the smae page (i.e., reloads) when complete.

  def toggle_active
    @resource = Resource.find(params[:id])
    @resource.toggle :active
    @resource.save
    redirect_to resources_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:name, :resource_category, :description, :link, :active)
    end
end
