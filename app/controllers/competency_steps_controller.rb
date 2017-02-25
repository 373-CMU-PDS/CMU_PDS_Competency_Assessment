class CompetencyStepsController < ApplicationController

  # Because of the number of steps and amount of information being entered, the
  # process of creating a competency relies on session.
  #
  # IMPORTANT NOTE: because so much data is being stored in the session at one
  # time, our system uses a session table in the databse to store session info.
  # This change was made in the /config/initializers/session_store.rb file;
  # Google search hwo to handle changing this if need be.
  #
  # This controller uses the Wicked gem, which allows the creation process to be
  # broken up into multiple steps. Each step calls the 'update' controller
  # method, and the Wicked gem keeps track of the 'step' variable (defined
  # below) to determine which step in the process the user is in. Each step
  # has an associated view with the same name as the step.
  #
  # Two important things to know:
  # 1) The upload controller function is called everytime a submit action is
  # executed on the front end.
  # 2) The show controller function is called before each view is rendered.
  #
  # Example for understanding:
  # If you are on the 'indicators' page and you click the 'submit' (or
  # equivalent) button, the update controller function will be called with the
  # step variable equal to 'indicators'. When 'redirect_to next_wizard_path' is
  # executed, the step variable advances to the next step: 'resources'. Before
  # the resources page is rendered, the 'show' controller function is executed.

	include Wicked::Wizard
  include AssessmentHelpers::Builder

  before_action :check_authentication
  
  steps :indicators, :resources, :verify

	def show
    @competency = Competency.new(session[:competency])
    @resource_options = Resource.active.all
    if session[:upload]
      # If the user is doing the upload methodology, then the resources they
      # uploaded will be in their own array for easy access.
      @uploaded_resource_options = get_uploaded_resources()
    end
    render_wizard
  end

  def update
    case step
    when :indicators
      session[:competency] = session[:competency].merge(params[:competency])
      @competency = Competency.new(session[:competency])
      redirect_to next_wizard_path
    when :resources
      session[:competency] = session[:competency].merge(params[:competency])
      @competency = Competency.new(session[:competency])
      redirect_to next_wizard_path
    when :verify
      @competency = Competency.new(session[:competency])
      build_competency(@competency)
      redirect_to @competency
    end
  end

  # The upload controller function is called when a user decides to use the 
  # upload method rather than the manual method. When this function is called,
  # it does three things:
  # 1) stores the competency name under session[:competency]["name"]
  # 2) gathers the indicator information from the provided indicators file, and
  # stores it under session[:competency]["indicators_attributes"]
  # 3) gathers the resrouces information from the provided resrouces file, and
  # stores it under session[:resources]
  #
  # Finally, it redirects to the :indicators step in the Wicked gem. All the
  # data from the files will be presented and the user can double check all
  # indiators were created correctly. When the user goes to the resources step,
  # they will have to map all indicator-resource relationships manually; the
  # uploaded resources will be presented. The mapping is done manually for two
  # reasons:
  # 1) error prevention
  # 2) it is too complicated to develop an algorithm that will do this

  def upload
    session[:competency] = nil
    session[:upload] = nil
    @competency = Competency.new(competency_params)
    session[:competency] = @competency.attributes

    indicator_info = Array.new
    indicator_file = params[:indicators]
    if indicator_file.blank?
      return redirect_to new_competency_path, notice: "Please select an apropriate Indicators file"
    elsif !indicator_file.content_type.eql?("text/csv");
      return redirect_to new_competency_path, notice: "Please select an apropriate Indicators file"
    end
    indicators = CSV.read(indicator_file.path, {:headers => true, :encoding => 'windows-1251:utf-8'})
    indicators.each do |indicator|
      level = indicator[0]
      description = indicator[1]
      possible_levels = Indicator::LEVELS_LIST
      if (possible_levels.include?(level) or possible_levels.map { |l| l.downcase }.include?(level))
        if (!description.blank?)
          indicator_info.push({level: level, description: description})
        else
          return redirect_to new_competency_path, notice: "Incorrect Indicators file upload; please assert your selected file follows the Indicators Template"
        end
      else
        return redirect_to new_competency_path, notice: "Incorrect Indicators file upload; please assert your selected file follows the Indicators Template"
      end
    end
    if indicator_info.size == 0
      return redirect_to new_competency_path, notice: "No data found in Indicators file"
    end
    session[:competency]["indicators_attributes"] = indicator_info

    resource_info = Array.new
    resources_file = params[:resources]
    if resources_file.blank?
      return redirect_to new_competency_path, notice: "Please select an apropriate Resources file"
    elsif !resources_file.content_type.eql?("text/csv");
      return redirect_to new_competency_path, notice: "Please select an apropriate Resources file"
    end
    resources = CSV.read(resources_file.path, {:headers => true, :encoding => 'windows-1251:utf-8'})
    resources.each do |resource|
      resource_category = resource[0]
      name = resource[1]
      description = [2]
      link = resource[3]
      resource_info.push({resource_category: resource_category, name: name, description: description, link: link})
    end
    if resource_info.size == 0
      return redirect_to new_competency_path, notice: "No data found in Resources file"
    end
    session[:resources] = resource_info

    session[:upload] = true

    redirect_to wizard_path(:indicators)
  end

  def competency_params
    params.require(:competency).permit(:name)
  end

  private
  def get_uploaded_resources()
    options = Array.new
    session[:resources].each do |resource|
      options.push(Resource.new(name: resource[:name], description: resource[:description], link: resource[:link], resource_category: resource[:resource_category]))
    end
    return options
  end

end
