class Manager < User
  has_many :managements, foreign_key: :manager_id, class_name: 'Leading', dependent: :destroy
  has_many :employees, through: :managements, source: :employee

  # belongs_to :study

  has_one :manager_involvement, foreign_key: :manager_id, class_name: 'ManagerParticipation', dependent: :destroy
  has_one :study, through: :manager_involvement, source: :study

  has_many :entries, dependent: :destroy

end
