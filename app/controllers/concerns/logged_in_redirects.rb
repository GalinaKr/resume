# frozen_string_literal: true

module LoggedInRedirects
  def current_signup_step_url
    "#{current_path}"
  end

  def incomplete_profile_redirect
    redirect_to current_signup_step_url unless profile_steps_path?
  end

  def store_location
    session[:previous_url] = request.fullpath if !request.xhr? && save_location_path?(request.fullpath)
  end

  def save_location_path?(fullpath)
    # The following paths will have redirects after logout/login
    %w[/profile].each do |pattern|
      return true if fullpath.index(pattern)&.zero?
    end
    false
  end

  private

  def current_path
    current_user.profile&.current_step
  end
end
