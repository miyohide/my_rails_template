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
  end
end
