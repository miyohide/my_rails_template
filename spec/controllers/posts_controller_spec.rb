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
        @posts = FactoryBot.create_list(:post, 3)
        login_user(FactoryBot.create(:user))
      end

      it "ログイン画面にリダイレクトせずにindex画面を描画すること" do
        expect(subject).to render_template(:index)
      end

      it "@postsが取得できていること" do
        subject
        expect(assigns :posts).to eq @posts
      end
    end
  end

  describe "GET #show/:id" do
    before do
      @post = FactoryBot.create(:post)
    end
    subject { get :show, params: { id: @post.id } }

    context "ログインしていないとき" do
      it "ログイン画面にリダイレクトすること" do
        expect(subject).to redirect_to("/login")
      end
    end

    context "ログインしているとき" do
      before do
        login_user(FactoryBot.create(:user))
      end

      it "ログイン画面にリダイレクトせずにshow画面を描画すること" do
        expect(subject).to render_template(:show)
      end

      it "@postsが取得できていること" do
        subject
        expect(assigns :post).to eq @post
      end
    end
  end

end
