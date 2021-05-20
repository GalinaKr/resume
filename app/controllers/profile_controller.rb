# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, :initial_check, :profile
  include AddFamily
  include WorkEducationExperience
  include WorkCertification

  def show
    certifications
    @profile = Profile.lookup(params[:slug])
  end

  def index
    profile
  end

  def change_family
    family_options

    redirect_after_change_profile
  end

  def change_basic_info
    @profile.user.update(
      first_name: params[:profile][:first_name],
      last_name: params[:profile][:last_name],
      location: params[:profile][:location]
    )
    @profile.update(change_basic_info_params)

    if params.dig(:profile, :redirect_reference) == 'account_page'
      redirect_to account_index_path
    else
      redirect_after_change_profile
    end
  end

  private

  def profile
    @profile ||= current_user.profile
  end

  def redirect_after_change_profile
    redirect_to profile_step_path(:summary)
  end

  def change_basic_info_params
    params.require(:profile)
          .permit(:professional_title,
                  :professional_summary)
  end
end
