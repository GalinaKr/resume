# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :check_signed_in

  def new
    byebug
    return redirect_to root_path unless session[:email].present?

    @email = session[:email]

    super
  end

  def edit
    @hide_password_section = user_signed_in?

    render 'devise/registrations/new'
  end

  def create
    session.delete(:email)

    super
  end

  def update
    current_user.update(google_signup_params)

    redirect_to forward_user_to_steps
  end

  protected

  def check_signed_in
    redirect_to current_signup_step_url if signed_in?
  end

  def after_sign_in_path_for(_resource)
    employer? ? employer_profile_steps_path(current_user) : freelancer_profile_steps_path(current_user)
  end

  def after_sign_up_path_for(_resource)
    forward_user_to_steps
  end

  def after_inactive_sign_up_path_for(_resource)
    forward_user_to_steps
  end

  def after_update_path_for(_resource)
    forward_user_to_steps
  end

  def forward_user_to_steps
    profile_steps_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email phone_number role])
  end

  private

  def google_signup_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :role, :signup_promo_id)
  end
end
