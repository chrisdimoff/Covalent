class EmployeeSurvey < ApplicationRecord
  belongs_to :study

  has_many :questions, dependent: :destroy
  has_many :entries, dependent: :nullify

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  validates :form_name, presence: true

end
