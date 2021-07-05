require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:valid)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post todos_url, params: { todo: { body: @todo.body, title: @todo.title } }
    end

    assert_redirected_to todo_url(Todo.last)
  end

  test "バリデーションエラーの時、todoは作られないこと" do
    assert_no_difference('Todo.count') do
      post todos_url, params: { todo: { body: "", title: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "バリデーションエラーの時、422エラー（Unprocessable Entity）を返すこと" do
    patch todo_url(@todo), params: { todo: { body: "", title: "" } }
    assert_response :unprocessable_entity
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { body: @todo.body, title: @todo.title } }
    assert_redirected_to todo_url(@todo)
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end
