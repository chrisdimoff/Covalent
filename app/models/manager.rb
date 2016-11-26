class Manager < User
  has_many :managements, foreign_key: :manager_id, class_name: 'Leading'
  has_many :employees, through: :managements, source: :employee

  # belongs_to :study

  has_one :manager_involvement, foreign_key: :manager_id, class_name: 'ManagerParticipation'
  has_one :study, through: :manager_involvement, source: :study

end
