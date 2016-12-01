class Entry < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :manager, optional: true
  belongs_to :study

  belongs_to :manager_survey, optional: true
  belongs_to :employee_survey, optional: true
end
