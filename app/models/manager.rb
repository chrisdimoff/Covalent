class Manager < User
  has_many :managements, foreign_key: :manager_id, class_name: 'Leading'
  has_many :employees, through: :managements, source: :employee

  belongs_to :study, optional: true

end
