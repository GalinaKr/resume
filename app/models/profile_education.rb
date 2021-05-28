# frozen_string_literal: true

class ProfileEducation < ApplicationRecord
  belongs_to :profile
  has_one :user, through: :profile

  validates :institution, presence: true
  validates :degree, presence: true
  validates :course_of_study, presence: true

  AVAILABLE_YEARS = (40.years.ago.year..Time.now.year).reverse_each
  enum degree: {
    "#{I18n.t('interface.steps.education.degree.bs')}": 0,
    "#{I18n.t('interface.steps.education.degree.ba')}": 1,
    "#{I18n.t('interface.steps.education.degree.masters')}": 2,
    "#{I18n.t('interface.steps.education.degree.phd')}": 3,
    "#{I18n.t('interface.steps.education.degree.ad')}": 4,
    "#{I18n.t('interface.steps.education.degree.sd')}": 5,
    "#{I18n.t('interface.steps.education.degree.ihe')}": 6,
    "#{I18n.t('interface.steps.education.degree.ise')}": 7,
    "#{I18n.t('interface.steps.education.degree.elementary')}": 8,
    "#{I18n.t('interface.steps.education.degree.ve')}": 9,
    "#{I18n.t('interface.steps.education.degree.specialist')}": 10,
    "#{I18n.t('interface.steps.education.degree.courses')}": 11
  }
  enum form_education: {
    "#{I18n.t('interface.steps.education.form_education.daytime')}": 0,
    "#{I18n.t('interface.steps.education.form_education.daytime_for_order')}": 1,
    "#{I18n.t('interface.steps.education.form_education.evening')}": 2,
    "#{I18n.t('interface.steps.education.form_education.externally')}": 3,
    "#{I18n.t('interface.steps.education.form_education.extramural')}": 4,
    "#{I18n.t('interface.steps.education.form_education.on_the_job')}": 5,
    "#{I18n.t('interface.steps.education.form_education.out_of_production')}": 7,
    "#{I18n.t('interface.steps.education.form_education.remote')}": 8,
    "#{I18n.t('interface.steps.education.form_education.part_time')}": 9,
    "#{I18n.t('interface.steps.education.form_education.retraining')}": 10
  }
end
