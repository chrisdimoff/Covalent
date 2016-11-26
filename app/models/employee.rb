class Employee < User

  has_one :subordination, foreign_key: :employee_id, class_name: 'Leading'
  has_one :manager, through: :subordination, source: :manager

  # belongs_to :study

end
