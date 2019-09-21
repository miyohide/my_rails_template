require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  describe "GET /user_sessions/new" do
    it "成功すること" do
      get "/user_sessions/new"
      expect(response).to have_http_status(:success)
    end

    it "ログイン画面にアクセスすること" do
      get "/user_sessions/new"
      expect(response.body).to include("Login")
    end
  end
end
