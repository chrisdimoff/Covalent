class Question < ApplicationRecord
  belongs_to :manager_survey, optional: true
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :responses, reject_if: :all_blank, allow_destroy: true
end
