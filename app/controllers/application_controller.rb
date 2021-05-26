# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include LoggedInRedirects
  include HttpAcceptLanguage::AutoLocale

  before_action :set_locale

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

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
