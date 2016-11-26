class ManagerParticipation < ApplicationRecord
  belongs_to :manager
  belongs_to :study
end
