require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    subject { get :index }

    context "ログインしていないとき" do
      it "ログイン画面にリダイレクトすること" do
        expect(subject).to redirect_to("/login")
      end
    end
  end

end
