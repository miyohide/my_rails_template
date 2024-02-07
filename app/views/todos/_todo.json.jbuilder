json.extract! todo, :id, :task_name, :created_at, :updated_at
json.url todo_url(todo, format: :json)
