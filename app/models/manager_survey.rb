class ManagerSurvey < ApplicationRecord
  belongs_to :study

  has_many :mc_questions, dependent: :destroy

  accepts_nested_attributes_for :mc_questions, reject_if: :all_blank, allow_destroy: true
end
