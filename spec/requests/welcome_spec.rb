require 'rails_helper'

RSpec.describe "Welcome", type: :request do
  describe "GET /" do
    subject { get root_path }

    context 'when user does not login' do
      it 'success. do not redirect to login page.' do
        subject
        expect(response).to have_http_status(200)
      end
    end

    context 'when user login' do
      create_and_login_user(FactoryBot.attributes_for(:user))

      it 'success. do not redirect to login page.' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
