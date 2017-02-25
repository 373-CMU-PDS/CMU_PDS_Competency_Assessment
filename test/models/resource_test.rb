require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
	#Relationship Macros
	should have_many(:indicator_resources)
	should have_many(:indicators).through(:indicator_resources)

 	#Validation Macros
 	should validate_presence_of(:name)
 	should validate_presence_of(:resource_category)

 	#Validate Name
 	should allow_value("Waltzing with Bears").for(:name)
 	should allow_value("Something: Something Else").for(:name)

 	#Validate Link
 	should allow_value("https://en.wikipedia.org/wiki/Master_of_Puppets").for(:link)
 	should allow_value("www.google.com").for(:link)
 	should allow_value("www.cmu.edu").for(:link)
 	should allow_value(nil).for(:link)
 	should_not allow_value("cmu.edu").for(:link)
 	should_not allow_value("oh my god").for(:link)
 	should_not allow_value(-2).for(:link)

 	#Validate Description
 	#string desc1 = "A comprehensive guide for talking with new yorkers."
 	#should allow_value(desc1).for(:description)
 	#should_not allow_value(-2).for(:description)

 	#Contexts
 	context "With a proper context, " do
        # I can create the objects I want with factories
        setup do
            create_context
        end

        # and provide a teardown method as well
        teardown do
            remove_context
        end

 		#Scope Test
 		should "have 3 active resources" do
 			assert_equal 3, Resource.active.size
 		end

 		should "have resources in alphabetical order" do
 			assert_equal ["Crocodile Dundee", "Steve Irwin: A Legacy", "Talking to New Yorkers", "Waltzing With Bears"], Resource.alphabetical.map{|o| o.name}
 		end

		should "have a scope for_indicator that works" do
			assert_equal 2, Resource.for_indicator(@indicator1).size
      		assert_equal 1, Resource.for_indicator(@indicator2).size
		end

        should "have a method to get the options for filterrific sorting" do
            assert_equal [['Name (a-z)', 'name asc'],['Name (z-a)', 'name desc'],['Type (a-z)', 'resource_category_desc'],['Type (z-a)', 'resource_category_asc']], Resource.options_for_sorted_by
        end

        should "have a method to get the options for sorting by active state" do
            assert_equal [["True", 't'],["False", 'f']], Resource.options_for_sort_active
        end

        should "have a method to get the options for sorting by categorr" do
            assert_equal [["MOVIE", "MOVIE"]], Resource.options_for_sort_by_category
        end

        should "have a method to get the resource categories in the system" do
            assert_equal ["MOVIE"], Resource.get_categories.map { |e| e.resource_category }
        end

        should "have method to sort resources" do
            assert_equal ["Crocodile Dundee", "Talking to New Yorkers", "Waltzing With Bears"], Resource.active.sorted_by("name asc").map { |e| e.name }
            assert_equal ["Waltzing With Bears", "Talking to New Yorkers", "Crocodile Dundee"], Resource.active.sorted_by("name desc").map { |e| e.name }
            assert_equal ["Crocodile Dundee", "Waltzing With Bears", "Talking to New Yorkers"], Resource.active.sorted_by("resource_category desc").map { |e| e.name }
            assert_equal ["Crocodile Dundee", "Waltzing With Bears", "Talking to New Yorkers"], Resource.active.sorted_by("resource_category asc").map { |e| e.name }
            assert_raise( ArgumentError ) { Resource.active.sorted_by("error").map { |e| e.name } }
        end

	end
#end of testing
end
