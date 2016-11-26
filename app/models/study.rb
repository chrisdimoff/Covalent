class Study < ApplicationRecord

  belongs_to :researcher

  # has_many :managers, dependent: :nullify
  # has_many :employees, dependent: :nullify

  has_many :manager_participations, foreign_key: :study_id, class_name: 'ManagerParticipation'
  has_many :employee_participations, foreign_key: :study_id, class_name: 'EmployeeParticipation'

  has_many :managers, through: :manager_participations, source: :manager

  has_many :employees, through: :employee_participations, source: :employee
end
