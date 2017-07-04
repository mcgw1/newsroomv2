require 'test_helper'

class SportPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sport_post = sport_posts(:one)
  end

  test "should get index" do
    get sport_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_sport_post_url
    assert_response :success
  end

  test "should create sport_post" do
    assert_difference('SportPost.count') do
      post sport_posts_url, params: { sport_post: { article: @sport_post.article, image: @sport_post.image, title: @sport_post.title } }
    end

    assert_redirected_to sport_post_url(SportPost.last)
  end

  test "should show sport_post" do
    get sport_post_url(@sport_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_sport_post_url(@sport_post)
    assert_response :success
  end

  test "should update sport_post" do
    patch sport_post_url(@sport_post), params: { sport_post: { article: @sport_post.article, image: @sport_post.image, title: @sport_post.title } }
    assert_redirected_to sport_post_url(@sport_post)
  end

  test "should destroy sport_post" do
    assert_difference('SportPost.count', -1) do
      delete sport_post_url(@sport_post)
    end

    assert_redirected_to sport_posts_url
  end
end
