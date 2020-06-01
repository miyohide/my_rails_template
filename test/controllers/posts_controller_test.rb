require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration

  def login_user(u)
    post user_sessions_path, params: { email: u.email, password: 'passw0rd' }
    follow_redirect!
  end

  setup do
    @user = users(:one)
    login_user(@user)
  end

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

  test "should not create post" do
    post posts_url, params: { post: { title: 't' * 201, body: 'b' } }

    assert_match "Title is too long", @response.body
  end

  test "should update post" do
    post = Post.create(title: "t", body: "b")
    patch post_url(post.id), params: { post: { title: 't1', body: 'b1' } }

    assert_redirected_to post_path(post)
  end

  test "should not update post" do
    post = Post.create(title: "t", body: "b")
    patch post_url(post.id), params: { post: { title: 't' * 201, body: 'b1' } }

    assert_match "Title is too long", @response.body
  end

  test "should delete post" do
    post = Post.create(title: "t", body: "b")
    assert_difference('Post.count', -1) do
      delete post_url(post.id)
    end

    assert_redirected_to posts_path
  end
end
