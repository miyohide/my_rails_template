require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "タイトルに何も入力されていないとき、バリデーションエラー" do
    todo = Todo.new(body: "test body")
    assert_not todo.save
  end

  test "本文に何も入力されていないとき、バリデーションエラー" do
    todo = Todo.new(title: "test title")
    assert_not todo.save
  end

  test "タイトルと本文に入力されているとき、保存できる" do
    todo = Todo.new(title: "test title", body: "test body")
    assert todo.save
  end

  test "最大文字数分タイトルを入力すると、保存できる" do
    todo = Todo.new(title: "a" * 200, body: "test body")
    assert todo.save
  end

  test "最大文字数分 + 1タイトルを入力すると、バリデーションエラー" do
    todo = Todo.new(title: "a" * 201, body: "test body")
    assert_not todo.save
  end

  test "空文字タイトルを入力すると、バリデーションエラー" do
    todo = Todo.new(title: "", body: "test body")
    assert_not todo.save
  end

  test "空白文字タイトルを入力すると、バリデーションエラー" do
    todo = Todo.new(title: "   ", body: "test body")
    assert_not todo.save
  end

  test "最大文字数分本文を入力すると、保存できる" do
    todo = Todo.new(title: "test title", body: "b" * 5000)
    assert todo.save
  end

  test "最大文字数分 + 1本文を入力すると、バリデーションエラー" do
    todo = Todo.new(title: "test title", body: "b" * 5001)
    assert_not todo.save
  end

  test "空文字本文を入力すると、バリデーションエラー" do
    todo = Todo.new(title: "test title", body: "")
    assert_not todo.save
  end

  test "空白文字本文を入力すると、バリデーションエラー" do
    todo = Todo.new(title: "test title", body: "    ")
    assert_not todo.save
  end
end
