# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def azure_activedirectory_v2
    @user = User.from_omniauth(request.env["omniauth.auth"]) 
    
    if @user&.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:danger] = 'You have not yet an account!'
      redirect_back(fallback_location: root_path)
    end
  end
end
