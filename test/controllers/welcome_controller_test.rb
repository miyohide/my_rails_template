require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "welcome_index_url（/welcome/index）ページにGETでアクセスできること" do
    get welcome_index_url
    assert_response :success
  end

  test "root_url（/）ページにGETでアクセスできること" do
    get root_url
    assert_response :success
  end
end
