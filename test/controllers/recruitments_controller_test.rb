require 'test_helper'

class RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruitments_index_url
    assert_response :success
  end

  test "should get show" do
    get recruitments_show_url
    assert_response :success
  end

  test "should get new" do
    get recruitments_new_url
    assert_response :success
  end

  test "should get create" do
    get recruitments_create_url
    assert_response :success
  end

  test "should get edit" do
    get recruitments_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get recruitments_destroy_url
    assert_response :success
  end

  test "should get update" do
    get recruitments_update_url
    assert_response :success
  end

  test "should get confirmation" do
    get recruitments_confirmation_url
    assert_response :success
  end

  test "should get complete" do
    get recruitments_complete_url
    assert_response :success
  end

end
