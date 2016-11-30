class EmployeeSurvey < ApplicationRecord
  belongs_to :study

  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true



end
