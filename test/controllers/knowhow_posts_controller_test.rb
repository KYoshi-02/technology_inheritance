require "test_helper"

class KnowhowPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @knowhow_post = knowhow_posts(:one)
  end

  test "should get index" do
    get knowhow_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_knowhow_post_url
    assert_response :success
  end

  test "should create knowhow_post" do
    assert_difference("KnowhowPost.count") do
      post knowhow_posts_url, params: { knowhow_post: { content: @knowhow_post.content, title: @knowhow_post.title, user_id: @knowhow_post.user_id } }
    end

    assert_redirected_to knowhow_post_url(KnowhowPost.last)
  end

  test "should show knowhow_post" do
    get knowhow_post_url(@knowhow_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_knowhow_post_url(@knowhow_post)
    assert_response :success
  end

  test "should update knowhow_post" do
    patch knowhow_post_url(@knowhow_post), params: { knowhow_post: { content: @knowhow_post.content, title: @knowhow_post.title, user_id: @knowhow_post.user_id } }
    assert_redirected_to knowhow_post_url(@knowhow_post)
  end

  test "should destroy knowhow_post" do
    assert_difference("KnowhowPost.count", -1) do
      delete knowhow_post_url(@knowhow_post)
    end

    assert_redirected_to knowhow_posts_url
  end
end
