# frozen_string_literal: true

class DegreeOfKinship < ApplicationRecord
  include Translatable

  has_many :families, dependent: :destroy
  has_many :profiles, through: :degree_of_kinships

  #validates description, uniqueness: true
  translates :description

  def description
    if I18n.locale == :en
      @description ||= families[0].degree_of_kinship.description_en
    elsif I18n.locale == :ru
      @description ||= families[0].degree_of_kinship.description_ru
    else
      @description ||= families[0].degree_of_kinship.description_ua
    end
  end
end
