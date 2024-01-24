require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "titleの入力がないとき、validationに失敗すること" do
    p = Post.new(body: "this is body")
    assert_not p.valid?
  end

  test "titleの入力が空文字のとき、validationに失敗すること" do
    p = Post.new(title: "", body: "this is body")
    assert_not p.valid?
  end

  test "titleの入力が51文字入力されているとき、validationに失敗すること" do
    p = Post.new(title: "a" * 51, body: "body")
    assert_not p.valid?
  end

  test "bodyの入力がないとき、validationに失敗すること" do
    p = Post.new(title: "this is title")
    assert_not p.valid?
  end

  test "bodyの入力が空文字のとき、validationに失敗すること" do
    p = Post.new(title: "this is title", body: "")
    assert_not p.valid?
  end

  test "titleの入力が50文字以下で、bodyの入力があるとき、Postが作成できること" do
    p = Post.new(title: "a" * 50, body: "body")
    assert p.save
  end
end
