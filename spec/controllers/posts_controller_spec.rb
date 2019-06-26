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

      it "ログイン画面にリダイレクトしないこと" do
        expect(subject).to render_template(:show)
      end
    end
  end

end
