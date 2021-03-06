# frozen_string_literal: true

module WorkEducationExperience
  def profile_education_save
    return unless params[:profile_education].present?

    education_options
  end

  def work_experience_save
    return unless params[:profile_experience].present?

    if work_profile_experience.present? && params[:commit] == t('button.delete')
      work_profile_experience.destroy
    elsif work_profile_experience.present?
      unless work_profile_experience.update(checked_profile_experience_params)
        flash.now[:alert] = work_profile_experience.errors.full_messages.join(', ')
      end
    else
      object = ProfileExperience.create(checked_profile_experience_params)
      flash.now[:alert] = object.errors.full_messages.join(', ') unless object.errors.count.zero?
    end
  end

  def language_save
    return unless params[:language].present?

    if language.present? && params[:commit] == t('button.delete')
      language.destroy
    elsif language.present?
      unless language.update(language_params)
        flash.now[:alert] = language.errors.full_messages.join(', ')
      end
    else
      object = Language.create(language_params)
      flash.now[:alert] = object.errors.full_messages.join(', ') unless object.errors.count.zero?
    end
  end

  private

  def education_options
    if education_profile_experience.present? && params[:commit] == t('button.delete')
      education_profile_experience.destroy
    elsif education_profile_experience.present?
      education_profile_experience.update(checked_profile_education_params)
    else
      ProfileEducation.create(checked_profile_education_params)
    end
  end

  def profile_experience_params
    params.require(:profile_experience)
          .permit(:id, :job_title, :company, :location, :description,
                  :start_month, :start_year, :end_month, :end_year, :current_job)
  end

  def profile_education_params
    params.require(:profile_education)
          .permit(:id, :institution, :course_of_study, :graduation_year, :currently_studying, :description).
      merge(degree_id: degree_params).
      merge(form_of_education_id: form_of_education_params)
  end

  def language_params
    params.require(:language).permit(:id, :lang_know).
      merge(profile_id: @profile.id).
      merge(language_level_id: language_level_params)
  end

  def checked_profile_education_params
    education_params = if currently_studying?
                         profile_education_params.reject { |param| param == 'graduation_year' }
                       else
                         profile_education_params
                       end

    education_params.merge(profile_id: @profile.id)
  end

  def currently_studying?
    params[:profile_education][:currently_studying] == true
  end

  def checked_profile_experience_params
    experience_params = if current_job?
                          profile_experience_params.reject { |param| param == 'end_month' || param == 'end_year' }
                        else
                          profile_experience_params
                        end

    experience_params.merge(profile_id: @profile.id)
  end

  def current_job?
    params[:profile_experience][:current_job] == '1'
  end

  def work_profile_experience
    @work_profile_experience ||=
      @profile&.profile_experiences&.find_by(id: params[:profile_experience][:id])
  end

  def education_profile_experience
    @education_profile_experience ||=
      @profile&.profile_educations&.find_by(id: params[:profile_education][:id])
  end

  def language
    @language ||= @profile&.languages&.find_by(id: params[:language][:id])
  end

  def language_level_params
    params[:language][:language_level_id]
  end

  def degree_params
    params[:profile_education][:degree_id]
  end

  def form_of_education_params
    params[:profile_education][:form_of_education_id]
  end
end
