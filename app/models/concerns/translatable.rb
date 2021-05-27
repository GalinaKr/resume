# frozen_string_literal: true

module Translatable
  extend ActiveSupport::Concern

  included do
    def self.translates(*attributes)
      attributes.each do |attribute|
        define_method(attribute) do
          translation_for(attribute)
        end
      end
    end
  end

  def translation_for(attribute)
    "#{attribute}_#{I18n.locale}"
  end
end
