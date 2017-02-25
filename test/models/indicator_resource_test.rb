require 'test_helper'

class IndicatorResourceTest < ActiveSupport::TestCase
  should belong_to(:resource)
  should belong_to(:indicator)
  should validate_presence_of(:resource_id)
  should validate_presence_of(:indicator_id)

  context "With a proper context, " do
    setup do
        create_context
    end
    teardown do
        remove_context
    end

    should "have a name method" do
        assert_equal "Crocodile Dundee", @a3.name
    end
  end
end
