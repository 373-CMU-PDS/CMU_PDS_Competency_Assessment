require 'test_helper'

class IndicatorTest < ActiveSupport::TestCase

  # Using Shoulda's ActiveRecord matchers
  # Relationship macros
  should belong_to(:competency)
  should have_many(:resources).through(:indicator_resources)
  should have_many(:indicator_resources)

  # Validation macros
  should validate_presence_of(:competency_id)
  should validate_presence_of(:level)
  should validate_presence_of(:description)

  # Validation for competency_id
  # Competency_id field can only be an integer
  should allow_value(2).for(:competency_id)
  should_not allow_value("Fred").for(:competency_id)



  
  context "With a proper context, " do
    # I can create the objects I want with factories
    setup do
      create_context
    end

    # and provide a teardown method as well
    teardown do
      remove_context
    end

    # test each factory object (not necessary, could be done in console)
    should "show that all factory objects are properly created" do
      assert_equal "Able to identify common nonverbal cues.", @indicator1.description
      assert_equal "Companion", @indicator1.level

      # @TODO add more asserts here

    end


    # TESTING SCOPES
    #
    # Available Indicator scopes
    #   - alphabetical
    #   - by_level
    #   - by_competency
    #   - active
    
    should "have all the indicators listed alphabetically by description" do
      assert_equal ["Able to identify apparent causes of a problem.", "Able to identify common nonverbal cues.", "Able to outline a plan to gather data that will aid in the completion of a familiar task.", "Able to present written communication in an easy–to-read format.", "Engages in difficult conversations with others while maintaining respect."], Indicator.alphabetical.map { |i| i.description }
    end

    should "have all the indicators listed for a specific level" do
      assert_equal ["Engages in difficult conversations with others while maintaining respect."], Indicator.by_level("Champion").alphabetical.map { |i| i.description }
    end

    should "have all the indicators listed that are nested beneath a specific competency" do
      assert_equal ["Able to identify apparent causes of a problem."], Indicator.by_competency("Problem Solving").alphabetical.map { |i| i.description }
    end

    should "have all the indicators listed that are active" do
      assert_equal ["Able to identify common nonverbal cues.", "Able to outline a plan to gather data that will aid in the completion of a familiar task.", "Able to present written communication in an easy–to-read format.", "Engages in difficult conversations with others while maintaining respect."], Indicator.active.alphabetical.map { |i| i.description }
    end

    should "have a method to get the options for sorting by level" do
      assert_equal [["Champion", "Champion"], ["Companion", "Companion"]], Indicator.options_for_sort_by_level
    end
    

  end
end
