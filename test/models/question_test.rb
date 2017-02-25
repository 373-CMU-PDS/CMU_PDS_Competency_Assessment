require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Relationship Macros
  should have_many(:indicator_questions)
  should have_many(:indicators).through(:indicator_questions)

  # Validation Macros
  should validate_presence_of(:question)

  # Contexts
  context "With a proper context, " do
      # setup
      setup do
        create_context
      end
      # teardown
      teardown do
          remove_context
      end

      # Scope Tests
      should "have 2 active questions" do
          assert_equal 2, Question.active.size
      end

      should "have 1 inactive question" do
          assert_equal 1, Question.inactive.size
      end

      should "have an alphabetical scope" do
          assert_equal ["How frequently do you give presentations?", "How often to you ask questions?"], Question.active.alphabetical.map { |e| e.question }
      end

  end

end
