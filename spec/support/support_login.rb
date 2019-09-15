module SupportLogin
  def create_and_login_user(user_params)
    before do
      # Request SpecではSorceryのlogin_userメソッドがうまく動かないので、
      # 直接/user_sessionsにログイン情報を渡してログイン処理を実施することにした。
      # 参考: https://github.com/NoamB/sorcery/issues/775
      u = User.create(user_params)
      post '/user_sessions', params: user_params
      u

    end
  end
end
