class Entry < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :manager, optional: true
  belongs_to :study

  belongs_to :manager_survey, optional: true
  belongs_to :employee_survey, optional: true

  belongs_to :target_person, foreign_key: :target_person_id, class_name: 'User', optional: true
end
