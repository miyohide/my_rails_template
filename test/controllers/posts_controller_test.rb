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

  test "should get edit" do
    post = Post.create(title: "t", body: "b")
    get edit_post_url(post.id)
    assert_response :success
  end

  test "shouldn't get edit when id doesn't exist" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get edit_post_url(12345)
    end
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { title: 't', body: 'b' } }
    end

    assert_redirected_to post_path(Post.last)
  end

  test "should update post" do
    post = Post.create(title: "t", body: "b")
    patch post_url(post.id), params: { post: { title: 't1', body: 'b1' } }

    assert_redirected_to post_path(post)
  end
end
