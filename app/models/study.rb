class Study < ApplicationRecord

  belongs_to :researcher

  has_many :managers, dependent: :nullify
  # has_many :employees, dependent: :nullify

  # has_many :participations, foreign_key: :study_id, class_name: 'Participation'
  # has_many :managers, through: :participations, source: :managers
end
