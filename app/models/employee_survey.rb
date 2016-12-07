class EmployeeSurvey < ApplicationRecord

  before_save :falsify_surveys

  belongs_to :study

  has_many :questions, dependent: :destroy
  has_many :entries, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  validates :form_name, presence: true

  def checked
    if self.active == true
      return "checked"
    else
      return ""
    end
  end

  private

  def falsify_surveys
    self.class.where('id != ?', self.id).where(study_id: self.study_id).update_all(active: false )

  end

end
