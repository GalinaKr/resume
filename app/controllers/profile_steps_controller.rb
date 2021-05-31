class ProfileStepsController < ApplicationController
  include Wicked::Wizard
  include AddFamily
  include WorkEducationExperience
  include WorkCertification
  include Translatable

  steps :personal_info, :family, :work_education_experience, :summary
  before_action :set_user, :set_profile

  def show
    @user.reload unless @user.profile.present?
    populate_available_options_for_data

    render_wizard
  end

  def update
    @certifications = certifications
    @degree_of_kinships = degree_of_kinships
    @form_of_educations = form_of_educations
    @degrees = degrees
    @language_levels = language_levels

    save_current_step
    personal_info_save || family_save || work_education_experience_save || summary_save
  end

  def finish_wizard_path
    send_resume_pdf

    reset_session
    root_path
    #render_wizard @user
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

  def send_resume_pdf
    recipient = 'support@gmail.com'
    output = UserResume.new.content
    filename = Time.zone.now.strftime("resume_#{@user.full_name}_%d-%m-%Y.pdf")
    user = @user.id
    File.open(Rails.root.join('storage_resume', filename), 'wb') do |f|
      f.write(output)
    end
    ResumeMailer.send_resume(output, recipient, user).deliver
  end

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

  def degree_of_kinships
    @degree_of_kinships ||= DegreeOfKinship.pluck(translation_for(:description), :id)
  end

  def form_of_educations
    @form_of_educations ||= FormOfEducation.pluck(translation_for(:description), :id)
  end

  def degrees
    @degrees ||= Degree.pluck(translation_for(:description), :id)
  end

  def language_levels
    @language_levels ||= LanguageLevel.pluck(translation_for(:description), :id)
  end

  def populate_available_options_for_data
    certifications
    degree_of_kinships
    form_of_educations
    degrees
    language_levels
  end
end
