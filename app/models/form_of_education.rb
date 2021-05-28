# frozen_string_literal: true

class FormOfEducation < ApplicationRecord
  include Translatable

  has_many :profile_educations, dependent: :destroy
  has_many :profiles, through: :form_of_educations

  #validates description, uniqueness: true
  translates :description

  def description
    if I18n.locale == :en
      @description ||= profile_educations[0].form_of_education.description_en
    elsif I18n.locale == :ru
      @description ||= profile_educations[0].form_of_education.description_ru
    else
      @description ||= profile_educations[0].form_of_education.description_ua
    end
  end
end
