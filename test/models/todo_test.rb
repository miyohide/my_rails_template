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
end
