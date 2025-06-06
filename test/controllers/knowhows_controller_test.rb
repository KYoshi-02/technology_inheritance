require "test_helper"

class KnowhowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get knowhows_index_url
    assert_response :success
  end

  test "should get new" do
    get knowhows_new_url
    assert_response :success
  end

  test "should get create" do
    get knowhows_create_url
    assert_response :success
  end

  test "should get show" do
    get knowhows_show_url
    assert_response :success
  end
end
