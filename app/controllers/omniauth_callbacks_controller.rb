class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # メソッドの中身は空（具体的な実装はまだ。プレースホルダーとして使われる）
  # ;をつけることで１行で書くことができる
  def line; basic_action end

  private
  def basic_action
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @profile = User.find_or_initialize_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
      unless @profile.email.present?
        email = @omniauth["info"]["email"] ? @omniauth["info"]["email"].presence : "#{@omniauth["uid"]}-#{@omniauth["provider"]}@example.com"
        @profile = current_user || User.create!(
          provider: @omniauth["provider"],
          uid: @omniauth["uid"],
          email: email,
          name: @omniauth["info"]["name"],
          password: Devise.friendly_token[0, 20]
        )
        end
      @profile.set_values(@omniauth)
      sign_in(:user, @profile)
    end
    flash[:notice] = "ログインしました"
    redirect_to root_path
  end

end
