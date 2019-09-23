require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  describe "GET /user_sessions/new" do
    it "成功すること" do
      get "/login"
      expect(response).to have_http_status(:success)
    end

    it "ログイン画面にアクセスすること" do
      get "/login"
      expect(response.body).to include("Login")
    end
  end

  describe "POST /user_sessions" do
    context "登録されているユーザ情報を与えた場合" do
      before do
        @user_param = FactoryBot.attributes_for(:user)
        User.create(@user_param)
      end

      it "ログインに成功してリダイレクトすること" do
        post "/user_sessions", params: @user_param
        expect(response).to redirect_to(posts_path)
      end
    end

    context "登録されていないユーザ情報を与えた場合" do
      before do
        @user_param = FactoryBot.attributes_for(:user)
      end

      it "再度ログイン画面を表示すること" do
        post "/user_sessions", params: @user_param
        expect(response.body).to include("Login")
      end
    end
  end

  describe "delete /logout" do
    before do
      login_user(FactoryBot.create(:user))
    end

    it "ログイン画面にリダイレクトすること" do
      delete "/logout"
      expect(response).to redirect_to("/login")
    end
  end
end
