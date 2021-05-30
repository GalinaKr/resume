# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, :profile
  include AddFamily
  include WorkEducationExperience
  include WorkCertification

  def show
    certifications
    degree_of_kinships
    form_of_educations
    degrees
    language_levels

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
      second_name: params[:profile][:second_name],
      last_name: params[:profile][:last_name],
      personal_tax_number: params[:profile][:personal_tax_number],
      phone_number: params[:profile][:phone_number],
      location: params[:profile][:location]
    )
    @profile.update(change_basic_info_params)

    if params.dig(:profile, :redirect_reference) == 'account_page'
      redirect_to account_index_path
    else
      redirect_after_change_profile
    end
  end

  def change_education
    education_options

    redirect_after_change_profile
  end

  def change_work_experience
    work_experience_save

    redirect_after_change_profile
  end

  def change_certification
    profile_certification_options

    redirect_after_change_profile
  end

  def change_language
    language_save

    redirect_after_change_profile
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
