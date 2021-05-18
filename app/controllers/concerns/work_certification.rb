# frozen_string_literal: true

module WorkCertification
  def certification_save
    return unless params[:profile_certification].present?

    profile_certification_options
  end

  private

  def profile_certification_options
    if profile_certification.present? && params[:commit] == 'Delete'
      profile_certification.destroy
    elsif profile_certification.present?
      profile_certification_update
    else
      profile_certification_create
    end
  end

  def check_edit_custom_certificate_field?
    return if profile_certification&.certification&.custom.nil?

    profile_certification.certification.custom !=
      (params[:profile_certification][:custom] == '1')
  end

  def custom?
    profile_certification.certification.custom
  end

  def profile_custom_certificate_update
    profile_certification.destroy
    profile_certification_create
  end

  def profile_certification_create
    @profile.profile_certifications.create(checked_profile_certification_params)
  end

  def profile_certification_update
    return profile_custom_certificate_update if check_edit_custom_certificate_field?

    profile_certification.update(checked_profile_certification_params)
  end

  def checked_profile_certification_params
    if params[:profile_certification][:description].blank?
      profile_certification_params
    else
      return profile_certification_params if check_edit_custom_certificate_field? && custom?
      return profile_certification_update_params if check_edit_custom_certificate_field? && !custom?

      params.require(:profile_certification)
            .permit(:id, :certification_id, :description, :earned_year, :earned_month)
            .merge(certification_id: Certification.custom_id)
    end
  end

  def profile_certification_params
    params.require(:profile_certification)
          .permit(:id, :certification_id, :earned_year, :earned_month)
          .merge(description: Certification.find_by(id: certification_params).description)
  end

  def profile_certification_update_params
    params.require(:profile_certification)
          .permit(:id, :earned_year, :earned_month)
          .merge(description: params[:profile_certification][:description],
                 certification_id: Certification.custom_id )
  end

  def certification_params
    params[:profile_certification][:certification_id]
  end

  def profile_certification
    @profile_certification ||=
      @profile&.profile_certifications&.find_by(id: params[:profile_certification][:id])
  end
end
