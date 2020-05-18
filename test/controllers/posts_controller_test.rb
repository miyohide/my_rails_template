require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    post = Post.create(title: "t", body: "b")
    get post_url(post.id)
    assert_response :success
  end

  test "shouldn't get show when id doesn't exist" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get post_url(1234)
    end
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end
end
