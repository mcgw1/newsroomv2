require 'test_helper'

class PolPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pol_post = pol_posts(:one)
  end

  test "should get index" do
    get pol_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_pol_post_url
    assert_response :success
  end

  test "should create pol_post" do
    assert_difference('PolPost.count') do
      post pol_posts_url, params: { pol_post: { article: @pol_post.article, image: @pol_post.image, title: @pol_post.title } }
    end

    assert_redirected_to pol_post_url(PolPost.last)
  end

  test "should show pol_post" do
    get pol_post_url(@pol_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_pol_post_url(@pol_post)
    assert_response :success
  end

  test "should update pol_post" do
    patch pol_post_url(@pol_post), params: { pol_post: { article: @pol_post.article, image: @pol_post.image, title: @pol_post.title } }
    assert_redirected_to pol_post_url(@pol_post)
  end

  test "should destroy pol_post" do
    assert_difference('PolPost.count', -1) do
      delete pol_post_url(@pol_post)
    end

    assert_redirected_to pol_posts_url
  end
end
