class Question < ApplicationRecord
  belongs_to :manager_survey, optional: true
  belongs_to :employee_survey, optional: true
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  def mc?
    if self.kind == "mc"
      return true
    else
      return false
    end
  end

  def matrix?
    if self.kind == "matrix"
      return true
    else
      return false
    end
  end

  def checklist?
    if self.kind == "checklist"
      return true
    else
      return false
    end
  end

  def headings
    string = self.matrix_headings

    return string.split(',').map(&:strip)
  end

end
