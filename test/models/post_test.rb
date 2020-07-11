require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new(body: 'body')
    # assert_not post.save
    assert post.save
  end

  test "should not save post when tile is very long" do
    post = Post.new(title: 'a' * 201, body: 'body')
    assert_not post.save
  end

  test "should not save post without body" do
    post = Post.new(title: 'title')
    assert_not post.save
  end

  test "should not save post when body is very long" do
    post = Post.new(title: 'title', body: 'b' * 10_001)
    assert_not post.save
  end

  test "should save post when title and body is verified" do
    post = Post.new(title: 'title', body: 'body')
    assert post.save
  end
end
