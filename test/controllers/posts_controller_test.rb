require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:normal_post)
  end

  test "posts_urlページ（/posts）にGETでアクセスできること" do
    get posts_url
    assert_response :success
  end

  test "new_post_urlページ（/posts/new）にGETでアクセスできること" do
    get new_post_url
    assert_response :success
  end

  test "posts_urlページ（/posts）にPOSTでアクセスするとPostが作られ、作られたPostページにリダイレクトすること" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: @post.body, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "post_url(@post)（/posts/:id）にGETでアクセスできること" do
    get post_url(@post)
    assert_response :success
  end

  test "edit_post_url(@post)（/posts/:id）ページにGETでアクセスできること" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "post_url(@post)（/posts/:id）にPATCHでアクセスすると、更新したPostページにリダイレクトすること" do
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test "post_url(@post)（/posts/:id）にDELETEでアクセスすると、該当のPostが削除されPosts#indexページにリダイレクトすること" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
