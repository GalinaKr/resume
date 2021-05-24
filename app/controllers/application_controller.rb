# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include LoggedInRedirects

  #before_action :store_location

  def after_sign_in_path_for(_resource)
    current_profile_step(_resource)
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  private

  def current_profile_step(user)
    return profile_steps_path if user.profile.current_step.blank?
    return profile_step_path(:summary) if user.profile.current_step == 'wicked_finish'

    profile_step_path(id: user.profile.current_step)
  end
end
