class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :check_authentication

  def choose_competency
    @competencies = Competency.all
  end

  # The view for questions uses the Filteriffic gem. Refer to the questions
  # model for details.

  def view
    @filterrific = initialize_filterrific(
      Question,
      params[:filterrific],
      select_options: {
        sort_active: Question.options_for_sort_active,
        sort_by_level: Indicator.options_for_sort_by_level
      }
    ) or return

    @competency = Competency.find(get_competency_id(params[:competency_id]))
    @indicators = Indicator.by_competency(@competency.name)
    @indicator_question = IndicatorQuestion.new
    @questions = Question.filterrific_find(@filterrific).by_competency(@competency.id).paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html
      format.js
    end
    
  end

  # This method is called when a user toggles the active state of a question.
  # It redirects to the smae page (i.e., reloads) when complete.

  def toggle_active
    @question = Question.find(params[:id])
    @question.toggle :active
    @question.save
    redirect_to :back
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new
    @question.question = params[:indicator_question][:question]

    respond_to do |format|
      if @question.save
        @indicator_question = IndicatorQuestion.new
        @indicator_question.question = @question
        @indicator_question.indicator = Indicator.find(params[:indicator_question][:indicator])
        if @indicator_question.save
          format.html { redirect_to :back, notice: 'Question was successfully created.' }
          format.json { render action: 'view', status: :created, location: @question }
        else
          format.html { render action: 'view' }
          format.json { render json: @indicator_question.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'view' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :active)
    end

    # Used to store competency_id in session for filtering the questions
    def get_competency_id(id)
      if id
        session[:question_competency_id] = id
        return id
      else
        return session[:question_competency_id]
      end
    end
end
