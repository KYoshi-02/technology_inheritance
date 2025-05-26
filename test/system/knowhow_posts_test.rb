require "application_system_test_case"

class KnowhowPostsTest < ApplicationSystemTestCase
  setup do
    @knowhow_post = knowhow_posts(:one)
  end

  test "visiting the index" do
    visit knowhow_posts_url
    assert_selector "h1", text: "Knowhow posts"
  end

  test "should create knowhow post" do
    visit knowhow_posts_url
    click_on "New knowhow post"

    fill_in "Content", with: @knowhow_post.content
    fill_in "Title", with: @knowhow_post.title
    fill_in "User", with: @knowhow_post.user_id
    click_on "Create Knowhow post"

    assert_text "Knowhow post was successfully created"
    click_on "Back"
  end

  test "should update Knowhow post" do
    visit knowhow_post_url(@knowhow_post)
    click_on "Edit this knowhow post", match: :first

    fill_in "Content", with: @knowhow_post.content
    fill_in "Title", with: @knowhow_post.title
    fill_in "User", with: @knowhow_post.user_id
    click_on "Update Knowhow post"

    assert_text "Knowhow post was successfully updated"
    click_on "Back"
  end

  test "should destroy Knowhow post" do
    visit knowhow_post_url(@knowhow_post)
    click_on "Destroy this knowhow post", match: :first

    assert_text "Knowhow post was successfully destroyed"
  end
end
