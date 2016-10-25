class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    Rails.logger.info "*" * 90
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user && @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "spotify"
      sign_in(:user, @user, { bypass: true })
      redirect_to dashboard_path
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    binding.pry
    set_flash_message :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
    redirect_to after_omniauth_failure_path_for(resource_name)
  end
end
