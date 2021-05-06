# frozen_string_literal: true

class ApplicationController < ActionController::Base
  #include LoggedInRedirects
  #include Pagy::Backend

  #before_action :store_location

  def after_sign_in_path_for(resource)
    #determine_correct_path(resource)
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  private

  def current_profile_step(user)
    return profile_steps_path(id: :summary) if profile_declined?(user)
    return profile_steps_path(id: :final_step) if profile_pending?(user)
    return profile_steps_path if user.profile.current_step.blank?

    profile_steps_path(id: user.profile.current_step)
  end
end
