class IndicatorQuestionsController < ApplicationController
  before_action :set_indicator_question, only: [:show, :edit, :update, :destroy]
  before_action :check_authentication

  # GET /indicator_questions
  # GET /indicator_questions.json
  def index
    @indicator_questions = IndicatorQuestion.all
  end

  # GET /indicator_questions/1
  # GET /indicator_questions/1.json
  def show
  end

  # GET /indicator_questions/new
  def new
    @indicator_question = IndicatorQuestion.new
  end

  # GET /indicator_questions/1/edit
  def edit
  end

  # POST /indicator_questions
  # POST /indicator_questions.json
  def create
    @indicator_question = IndicatorQuestion.new(indicator_question_params)

    respond_to do |format|
      if @indicator_question.save
        format.html { redirect_to @indicator_question, notice: 'Indicator question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @indicator_question }
      else
        format.html { render action: 'new' }
        format.json { render json: @indicator_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicator_questions/1
  # PATCH/PUT /indicator_questions/1.json
  def update
    respond_to do |format|
      if @indicator_question.update(indicator_question_params)
        format.html { redirect_to @indicator_question, notice: 'Indicator question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @indicator_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicator_questions/1
  # DELETE /indicator_questions/1.json
  def destroy
    @indicator_question.destroy
    respond_to do |format|
      format.html { redirect_to indicator_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator_question
      @indicator_question = IndicatorQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_question_params
      params.require(:indicator_question).permit(:indicator_id, :question_id, :active)
    end
end
