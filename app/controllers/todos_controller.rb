# TodosController は /todos 以下にアクセスがあったときに
# 実行する処理を定めるクラス
class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # index メソッドは /todos または /todos.json
  # に対してGET HTTPメソッドでアクセスしたときに
  # 実行されるメソッド。
  # Todo モデルから全件取得して @todos に格納する。
  def index
    @todos = Todo.all
  end

  # show メソッドは /todos/1 または /todos/1.json
  # に対してGET HTTPメソッドでアクセスしたときに
  # 実行されるメソッド。
  # URL 内に含まれる対象データの id に対応する Todo モデル
  # のインスタンスを @todo に格納する。
  def show
  end

  # new メソッドは /todos/new に対してGET HTTPメソッドで
  # アクセスしたときに実行されるメソッド。
  # 新しい Todo モデルのインスタンスを @todo に格納する。
  def new
    @todo = Todo.new
  end

  # edit メソッドは /todos/1/edit に対してGET HTTPメソッド
  # でアクセスしたときに実行されるメソッド。
  # URL 内に含まれる対象データの id に対応する Todo モデル
  # のインスタンスを @todo に格納する。
  def edit
  end

  # create メソッドは /todos または /todos.json
  # に対してPOST HTTPメソッドでアクセスしたときに実行される
  # メソッド。
  # 与えられたパラメータを使って Todo モデルのインスタンスを
  # 作成し、呼び出し元に返す。
  # /todos アクセス時、成功した場合は show 画面にリダイレクトする。
  # /todos アクセス時、失敗した場合は new 画面にリダイレクトする。
  # /todos.json アクセス時、成功した場合は 作成した Todo モデルの
  # インスタンスを JSON 形式で返す。
  # /todos.json アクセス時、失敗した場合は、エラー内容を JSON 形式
  # で返す。
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # update メソッドは /todos/1 または /todos/1.json
  # に対して PATCH/PUT HTTPメソッドでアクセスしたときに実行
  # されるメソッド。
  # /todos アクセス時、成功した場合は show 画面にリダイレクトする。
  # /todos アクセス時、失敗した場合は new 画面にリダイレクトする。
  # /todos.json アクセス時、成功した場合は 更新した Todo モデルの
  # インスタンスを JSON 形式で返す。
  # /todos.json アクセス時、失敗した場合は、エラー内容を JSON 形式
  # で返す。
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # destroy メソッドは /todos/1 または /todos/1.json に対して
  # DELETE HTTPメソッドでアクセスしたときに実行されるメソッド
  # /todos アクセス時は、index 画面にリダイレクトする。
  # /todos.json アクセス時は、HTTP ヘッダーのみで構成されたレスポンスを返す
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :body)
    end
end
