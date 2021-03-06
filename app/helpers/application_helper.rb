# frozen_string_literal: true

module ApplicationHelper
  def select_months_array
    ProfileExperience::AVAILABLE_MONTHNAMES.each_with_index.collect { |m, i| [ I18n.t(m), i+1] }
  end
end
