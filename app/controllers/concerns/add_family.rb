# frozen_string_literal: true

module AddFamily
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
    byebug
    params.require(:family)
          .permit(:id, :f_first_name, :f_second_name, :f_last_name, :f_birthday, :degree_of_kinship, :place_of_work)
  end

  def family
    @family ||=
      @profile&.families&.find_by(id: params[:family][:id])
  end
end
