require 'test_helper'

class CompetencyTest < ActiveSupport::TestCase

    # Relationship tests
    should have_many(:indicators)

    # Validation tests
    should validate_presence_of(:name)

    should allow_value("Communication").for(:name)
    should_not allow_value("").for(:name)

    # Scope and method tests
    context "With a proper context, " do
        # I can create the objects I want with factories
        setup do
            create_context
        end

        # and provide a teardown method as well
        teardown do
            remove_context
        end

        # test one of each factory object (not really required, could be done in console)
        should "show that all factory objects are properly created" do
            # test objects in here
            assert_equal false, @communication.nil?
            assert_equal "Communication", @communication.name
            assert_equal "Decision Making", @decision_making.name
            assert_equal "Problem Solving", @problem_solving.name
        end

        should "have competenices listed alphabetically" do
            # test alphabetical scope
            assert_equal ["Communication", "Decision Making", "Problem Solving"], Competency.alphabetical.map { |e| e.name }
        end

        should "have all active competencies" do
            # test active scope
            assert_equal ["Communication", "Decision Making"], Competency.active.alphabetical.map { |e| e.name }
        end

        should "have all inactive competencies" do
            # test inactive scope
            assert_equal ["Problem Solving"], Competency.inactive.alphabetical.map { |e| e.name }
        end

        should "have a method to get all the options for sorting by competency" do
            assert_equal [["Communication", "Communication"], ["Decision Making", "Decision Making"], ["Problem Solving", "Problem Solving"]], Competency.options_for_sort_by_competency
        end

    end

end
