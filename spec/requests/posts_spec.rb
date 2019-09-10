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
      before do
        @posts = FactoryBot.create_list(:post, 3)
        FactoryBot.create(:user)
        # Request SpecではSorceryのlogin_userメソッドがうまく動かないので、
        # 直接/user_sessionsにログイン情報を渡してログイン処理を実施することにした。
        # 参考: https://github.com/NoamB/sorcery/issues/775
        post '/user_sessions', params: FactoryBot.attributes_for(:user)
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
  end
end
