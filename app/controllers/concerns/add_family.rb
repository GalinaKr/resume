# frozen_string_literal: true

module AddFamily
  include Translatable

  def add_family
    return unless params[:family].present?

    family_options
  end

  private

  def family_options
    if family.present? && params[:commit] == 'Delete'
      family.destroy
    elsif family.present?
      family.update(family_params)
    else
      Family.create(family_params)
    end
  end

  def family_params
    params.require(:family)
          .permit(:id, :f_first_name, :f_second_name, :f_last_name,
                  :f_birthday, :place_of_work).merge(profile_id: @profile.id).
      merge(degree_of_kinship_id: degree_of_kinship_params)
  end

  def family
    @family ||=
      @profile&.families&.find_by(id: params[:family][:id])
  end

  def degree_of_kinship_params
    params[:family][:degree_of_kinship_id]
  end
end
