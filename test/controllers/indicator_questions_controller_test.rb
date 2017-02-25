require 'test_helper'

class IndicatorQuestionsControllerTest < ActionController::TestCase
  setup do
    @indicator_question = indicator_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicator_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicator_question" do
    assert_difference('IndicatorQuestion.count') do
      post :create, indicator_question: { active: @indicator_question.active, indicator_id: @indicator_question.indicator_id, question_id: @indicator_question.question_id }
    end

    assert_redirected_to indicator_question_path(assigns(:indicator_question))
  end

  test "should show indicator_question" do
    get :show, id: @indicator_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicator_question
    assert_response :success
  end

  test "should update indicator_question" do
    patch :update, id: @indicator_question, indicator_question: { active: @indicator_question.active, indicator_id: @indicator_question.indicator_id, question_id: @indicator_question.question_id }
    assert_redirected_to indicator_question_path(assigns(:indicator_question))
  end

  test "should destroy indicator_question" do
    assert_difference('IndicatorQuestion.count', -1) do
      delete :destroy, id: @indicator_question
    end

    assert_redirected_to indicator_questions_path
  end
end
