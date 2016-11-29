class Entry < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :manager, optional: true
  belongs_to :study
end
