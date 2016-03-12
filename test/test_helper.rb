require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'turn/autorun'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  # ----------------------------------------------------
  # THIS HELPER METHOD IS NOT A DEFAULT METHOD IN RAILS
  # (added in by Prof. H; will have to include it if used in phase 2)
  def deny(condition)
    # a simple transformation to increase readability IMO
    assert !condition
  end


# For formatting the test output a little nicer
Turn.config.format = :outline


  # CREATE_ & REMOVE_CONTEXT HELPER METHODS NOT DEFAULT METHODS IN RAILS (added in by Prof. H)
  def create_context
    # create FactoryGirl objects
    # examples:
    # @ruby    = FactoryGirl.create(:category)
    # @rails   = FactoryGirl.create(:category, name: "Rails")

    # Create three competencies
    @communication = FactoryGirl.create(:competency)
    @decision_making = FactoryGirl.create(:competency, name: "Decision Making")
    @problem_solving = FactoryGirl.create(:competency, name: "Problem Solving", active: false)

    # Create four indicators
    @indicator1 = FactoryGirl.create(:indicator, competency: @communication)
    @indicator2 = FactoryGirl.create(:indicator, competency: @communication, description: "Able to present written communication in an easy–to-read format.")
    @indicator3 = FactoryGirl.create(:indicator, competency: @communication, level: "Champion", description: "Engages in difficult conversations with others while maintaining respect.")
    @indicator4 = FactoryGirl.create(:indicator, competency: @decision_making, level: "Companion", description: "Able to find the power button for electronic devices." )
    @indicator5 = FactoryGirl.create(:indicator, competency: @problem_solving, level: "Companion", description: "Able to press buttons", active: false)
  end
  
  def remove_context
    # destroy FactoryGirl objects
    # example:
    # @ruby.destroy

    # Destroy the indicator objects
    @indicator1.destroy
    @indicator2.destroy
    @indicator3.destroy
    @indicator4.destroy

    # Destroy the competency objects
    @communication.destroy
    @decision_making.destroy
    @problem_solving.destroy
  end

end

