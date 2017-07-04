require 'test_helper'

class TechPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tech_post = tech_posts(:one)
  end

  test "should get index" do
    get tech_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_tech_post_url
    assert_response :success
  end

  test "should create tech_post" do
    assert_difference('TechPost.count') do
      post tech_posts_url, params: { tech_post: { article: @tech_post.article, image: @tech_post.image, title: @tech_post.title } }
    end

    assert_redirected_to tech_post_url(TechPost.last)
  end

  test "should show tech_post" do
    get tech_post_url(@tech_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_tech_post_url(@tech_post)
    assert_response :success
  end

  test "should update tech_post" do
    patch tech_post_url(@tech_post), params: { tech_post: { article: @tech_post.article, image: @tech_post.image, title: @tech_post.title } }
    assert_redirected_to tech_post_url(@tech_post)
  end

  test "should destroy tech_post" do
    assert_difference('TechPost.count', -1) do
      delete tech_post_url(@tech_post)
    end

    assert_redirected_to tech_posts_url
  end
end
