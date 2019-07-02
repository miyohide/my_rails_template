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

  describe "GET #new" do
    subject { get :new}

    context "ログインしていないとき" do
      it "ログイン画面にリダイレクトすること" do
        expect(subject).to redirect_to("/login")
      end
    end

    context "ログインしているとき" do
      before do
        login_user(FactoryBot.create(:user))
      end

      it "ログイン画面にリダイレクトせずにnew画面を描画すること" do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe "POST #create" do
    subject { post :create, params: { post: { title: "title1", body: "body1" } }}

    context "ログインしていないとき" do
      it "ログイン画面にリダイレクトすること" do
        expect(subject).to redirect_to("/login")
      end
    end

    context "ログインしているとき" do
      before do
        login_user(FactoryBot.create(:user))
      end

      it "ログイン画面にリダイレクトせずにPostの詳細画面にリダイレクトすること" do
        expect(subject).to redirect_to("/posts/#{assigns(:post).id}")
      end

      it "Postが1件増えていること" do
        expect{ subject }.to change{ Post.count }.by(1)
      end
    end
  end

  describe "PUT #update" do
    before do
      @post = FactoryBot.create(:post)
      @updated_title = "updated_title1"
      @updated_body  = "updated_body1"
    end
    subject { put :update, params: { id: @post.id, post: { title: @updated_title, body: @updated_body } }}

    context "ログインしていないとき" do
      it "ログイン画面にリダイレクトすること" do
        expect(subject).to redirect_to("/login")
      end
    end

    context "ログインしているとき" do
      before do
        login_user(FactoryBot.create(:user))
      end

      it "ログイン画面にリダイレクトせずにPostの詳細画面にリダイレクトすること" do
        expect(subject).to redirect_to("/posts/#{@post.id}")
      end

      it "Postが増えていないこと" do
        expect{ subject }.to change{ Post.count }.by(0)
      end

      it "Postの値が更新されていること" do
        subject
        expect(Post.find(@post.id).title).to eq(@updated_title)
        expect(Post.find(@post.id).body).to eq(@updated_body)
      end
    end
  end
end
