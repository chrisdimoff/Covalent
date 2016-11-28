class ManagerSurvey < ApplicationRecord
  belongs_to :study

  has_many :mc_questions, dependent: :destroy
end
