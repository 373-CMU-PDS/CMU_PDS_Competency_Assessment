require 'test_helper'

class IndicatorResourcesControllerTest < ActionController::TestCase
  setup do
    @indicator_resource = indicator_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicator_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicator_resource" do
    assert_difference('IndicatorResource.count') do
      post :create, indicator_resource: { indicator_id: @indicator_resource.indicator_id, resource_id: @indicator_resource.resource_id }
    end

    assert_redirected_to indicator_resource_path(assigns(:indicator_resource))
  end

  test "should show indicator_resource" do
    get :show, id: @indicator_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicator_resource
    assert_response :success
  end

  test "should update indicator_resource" do
    patch :update, id: @indicator_resource, indicator_resource: { indicator_id: @indicator_resource.indicator_id, resource_id: @indicator_resource.resource_id }
    assert_redirected_to indicator_resource_path(assigns(:indicator_resource))
  end

  test "should destroy indicator_resource" do
    assert_difference('IndicatorResource.count', -1) do
      delete :destroy, id: @indicator_resource
    end

    assert_redirected_to indicator_resources_path
  end
end
