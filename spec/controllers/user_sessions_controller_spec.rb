require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "ログイン画面にアクセスすること" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "登録されているユーザ情報を与えた場合" do
      before do
        @user_param = FactoryBot.attributes_for(:user)
        User.create(@user_param)
      end

      it "ログインに成功すること" do
        post :create, params: @user_param
        expect(response).to redirect_to(posts_path)
      end
    end

    context "登録されていないユーザ情報を与えた場合" do
      it "ログインに失敗すること" do
        post :create, params: FactoryBot.attributes_for(:user)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      login_user(FactoryBot.create(:user))
    end

    it "rootパスにリダイレクトすること" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end

end
