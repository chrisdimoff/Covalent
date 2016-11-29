class Question < ApplicationRecord
  belongs_to :manager_survey, optional: true
end
