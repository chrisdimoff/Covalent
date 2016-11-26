class EmployeeParticipation < ApplicationRecord
  belongs_to :employee
  belongs_to :study
end
