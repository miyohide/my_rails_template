require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    subject { get posts_path }

    context 'when user does not login' do
      it 'redirect to login page' do
        subject
        expect(response).to redirect_to('/login')
      end
    end

    context 'when user login' do
      create_and_login_user(FactoryBot.attributes_for(:user))

      before do
        @posts = FactoryBot.create_list(:post, 3)
        subject
      end

      it 'success to request' do
        expect(response.status).to eq 200
      end

      it 'contain all posted data' do
        @posts.each do |post|
          expect(response.body).to include(post.title)
        end
      end
    end
  end

  describe "GET /posts/:id" do
    context "when user does not login" do
      before do
        @post = FactoryBot.create(:post)
      end

      it "redirect to login page" do
        get post_url(@post)
        expect(response).to redirect_to('/login')
      end
    end

    context 'when user login' do
      create_and_login_user(FactoryBot.attributes_for(:user))

      before do
        @posts = FactoryBot.create_list(:post, 3)
        get post_url(@posts[1])
      end

      it 'success to request' do
        expect(response.status).to eq 200
      end

      it 'contains target post data' do
        expect(response.body).not_to include(@posts[0].title)
        expect(response.body).to include(@posts[1].title)
        expect(response.body).not_to include(@posts[2].title)
      end
    end
  end

  describe "GET /posts/new" do
    context "when user does not login" do
      it "redirect to login page" do
        get new_post_url
        expect(response).to redirect_to('/login')
      end
    end

    context "when user login" do
      create_and_login_user(FactoryBot.attributes_for(:user))

      before do
        get new_post_url
      end

      it 'success to request' do
        expect(response.status).to eq 200
      end

      it "New Postの文字列があること" do
        expect(response.body).to include("New Post")
      end
    end
  end

  describe "POST /posts" do
    context "when user does not login" do
      it "redirect to login page" do
        post posts_url
        expect(response).to redirect_to('/login')
      end
    end

    context "when user login" do
      create_and_login_user(FactoryBot.attributes_for(:user))

      it 'success to request' do
        post posts_url, params: {post: FactoryBot.attributes_for(:post)}
        expect(response).to have_http_status(:found)
      end

      it 'redirect to show page' do
        post posts_url, params: {post: FactoryBot.attributes_for(:post)}
        expect(response).to redirect_to(post_url(Post.last))
      end

      it 'create post data' do
        expect do
          post posts_url, params: {post: FactoryBot.attributes_for(:post)}
        end.to change(Post, :count).by(1)
      end
    end
  end

  describe "put /posts/:id" do
    context "when user does not login" do
      it "redirect to login page" do
        p = FactoryBot.create(:post)
        params = FactoryBot.attributes_for(:post)
        params.merge({title: 'updated title'})
        put post_url(p), params: {post: params}
        expect(response).to redirect_to('/login')
      end
    end

    context "when user login" do
      create_and_login_user(FactoryBot.attributes_for(:user))

      before do
        @post = FactoryBot.create(:post)
        @updated_title = "updated title"
        @params = FactoryBot.attributes_for(:post)
        @params.merge!({title: @updated_title})
      end

      it 'success to request' do
        put post_url(@post), params: {post: @params}
        expect(response).to have_http_status(:found)
      end

      it 'redirect to show page' do
        put post_url(@post), params: {post: @params}
        expect(response).to redirect_to(post_url(Post.last))
      end

      it 'update post data' do
        put post_url(@post), params: {post: @params}
        expect(@post.reload.title).to eq(@updated_title)
      end
    end
  end

  describe "delete /posts/:id" do
    context "when user does not login" do
      it "redirect to login page" do
        p = FactoryBot.create(:post)
        delete post_url(p)
        expect(response).to redirect_to('/login')
      end
    end

    context "when user login" do
      create_and_login_user(FactoryBot.attributes_for(:user))

      before do
        @post = FactoryBot.create(:post)
      end

      it 'success to request' do
        delete post_url(@post)
        expect(response).to have_http_status(:found)
      end

      it 'redirect to index page' do
        delete post_url(@post)
        expect(response).to redirect_to(posts_url)
      end

      it 'delete post data' do
        expect do
          delete post_url(@post)
        end.to change(Post, :count).by(-1)
      end
    end
  end
end
