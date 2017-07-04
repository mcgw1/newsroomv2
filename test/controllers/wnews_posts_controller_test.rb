require 'test_helper'

class WnewsPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wnews_post = wnews_posts(:one)
  end

  test "should get index" do
    get wnews_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_wnews_post_url
    assert_response :success
  end

  test "should create wnews_post" do
    assert_difference('WnewsPost.count') do
      post wnews_posts_url, params: { wnews_post: { article: @wnews_post.article, image: @wnews_post.image, title: @wnews_post.title } }
    end

    assert_redirected_to wnews_post_url(WnewsPost.last)
  end

  test "should show wnews_post" do
    get wnews_post_url(@wnews_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_wnews_post_url(@wnews_post)
    assert_response :success
  end

  test "should update wnews_post" do
    patch wnews_post_url(@wnews_post), params: { wnews_post: { article: @wnews_post.article, image: @wnews_post.image, title: @wnews_post.title } }
    assert_redirected_to wnews_post_url(@wnews_post)
  end

  test "should destroy wnews_post" do
    assert_difference('WnewsPost.count', -1) do
      delete wnews_post_url(@wnews_post)
    end

    assert_redirected_to wnews_posts_url
  end
end
