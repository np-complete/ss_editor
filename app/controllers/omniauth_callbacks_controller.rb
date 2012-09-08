class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    identity_url = request.env["omniauth.auth"].uid
    @user = User.auth(identity_url)

    if @user
      sign_in_and_redirect @user
    else
      session[:identity_url] = identity_url
      redirect_to new_user_path
    end
  end
end
