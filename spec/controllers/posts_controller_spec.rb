require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    subject { get :index }

    context "ログインしていないとき" do
      it "ログイン画面にリダイレクトすること" do
        expect(subject).to redirect_to("/login")
      end
    end

    context "ログインしているとき" do
      before do
        login_user(FactoryBot.create(:user))
      end

      it "ログイン画面にリダイレクトせずにindex画面を描画すること" do
        expect(subject).to render_template(:index)
      end
    end
  end

end
