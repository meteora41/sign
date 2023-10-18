require "test_helper"

class Users::RecruitingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_recruitings_show_url
    assert_response :success
  end

  test "should get index" do
    get users_recruitings_index_url
    assert_response :success
  end

  test "should get edit" do
    get users_recruitings_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_recruitings_update_url
    assert_response :success
  end

  test "should get create" do
    get users_recruitings_create_url
    assert_response :success
  end
end
