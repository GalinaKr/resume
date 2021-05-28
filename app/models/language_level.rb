# frozen_string_literal: true

class LanguageLevel < ApplicationRecord
  include Translatable

  has_many :languages, dependent: :destroy
  has_many :profiles, through: :language_levels

  #validates description, uniqueness: true
  translates :description

  def description
    if I18n.locale == :en
      @description ||= languages[0].language_level.description_en
    elsif I18n.locale == :ru
      @description ||= languages[0].language_level.description_ru
    else
      @description ||= languages[0].language_level.description_ua
    end
  end
end
