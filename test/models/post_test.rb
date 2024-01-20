require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "titleの入力がないとき、validationに失敗すること" do
    p = Post.new(body: "this is body")
    assert !p.valid?
  end

  test "titleの入力が51文字入力されているとき、validationに失敗すること" do
    p = Post.new(title: "a" * 51, body: "body")
    assert !p.valid?
  end

  test "bodyの入力がないとき、validationに失敗すること" do
    p = Post.new(title: "this is title")
    assert !p.valid?
  end
end
