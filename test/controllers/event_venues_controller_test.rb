require 'test_helper'

class EventVenuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_venues_index_url
    assert_response :success
  end

  test "should get show" do
    get event_venues_show_url
    assert_response :success
  end

  test "should get new" do
    get event_venues_new_url
    assert_response :success
  end

  test "should get edit" do
    get event_venues_edit_url
    assert_response :success
  end

  test "should get create" do
    get event_venues_create_url
    assert_response :success
  end

  test "should get update" do
    get event_venues_update_url
    assert_response :success
  end

  test "should get destroy" do
    get event_venues_destroy_url
    assert_response :success
  end

end
