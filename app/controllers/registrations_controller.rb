class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    onboarding_path
  end
end
