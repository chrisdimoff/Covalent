class Employee < User

  has_one :subordination, foreign_key: :employee_id, class_name: 'Leading', dependent: :destroy
  has_one :manager, through: :subordination, source: :manager

  # belongs_to :study
  has_one :employee_involvement, foreign_key: :employee_id, class_name: 'EmployeeParticipation', dependent: :destroy
  has_one :study, through: :employee_involvement, source: :study

  # belongs_to :study

end
