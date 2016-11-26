class Participation < ApplicationRecord
  belongs_to :study
  belongs_to :manager
  belongs_to :employee
end
