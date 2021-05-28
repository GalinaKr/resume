# frozen_string_literal: true

class Language < ApplicationRecord
  belongs_to :profile
  has_one :user, through: :profile

  enum level: {
    "#{I18n.t('interface.steps.language.level.native')}": 0,
    "#{I18n.t('interface.steps.language.level.a1')}": 1,
    "#{I18n.t('interface.steps.language.level.a2')}": 2,
    "#{I18n.t('interface.steps.language.level.b1')}": 3,
    "#{I18n.t('interface.steps.language.level.b2')}": 4,
    "#{I18n.t('interface.steps.language.level.c1')}": 5,
    "#{I18n.t('interface.steps.language.level.c2')}": 6
  }
end
