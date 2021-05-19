class ProfileStepsController < ApplicationController
  include Wicked::Wizard
  include AddFamily
  include WorkEducationExperience
  include WorkCertification
  steps :personal_info, :family, :work_education_experience, :summary
  before_action :set_user, :set_profile

  def show
    @user.reload unless @user.profile.present?
    populate_available_options_for_data

    render_wizard
  end

  def update
    @certifications = certifications

    save_current_step
    personal_info_save || family_save || work_education_experience_save
  end

  def finish_wizard_path
    #reset_session
    root_path
  end

  def summary_save
    return false unless wizard_value(step) == :summary

    @profile.save
    render_wizard @user

    true
  end

  def personal_info_save
    return false unless wizard_value(step) == :personal_info

    @user.location = params[:user][:location]
    @user.personal_tax_number = params[:user][:personal_tax_number]
    @user.birthday = params[:user][:birthday]
    @user.save
    render_wizard @user

    true
  end

  def family_save
    return false unless wizard_value(step) == :family

    add_family

    render wizard_path(:family)

    true
  end

  def work_education_experience_save
    return false unless wizard_value(step) == :work_education_experience

    profile_education_save
    work_experience_save
    certification_save
    language_save

    render wizard_path(:work_education_experience)

    true
  end

  private

  def set_user
    @user ||= current_user
  end

  def set_profile
    @profile = @user.profile || Profile.create(user_id: @user.id)
  end

  def save_current_step
    @profile.current_step = wizard_value(next_step)
    @profile.save
  end

  def certifications
    @certifications ||= Certification.pluck(:description, :id)
  end

  def populate_available_options_for_data
    certifications
  end
end
