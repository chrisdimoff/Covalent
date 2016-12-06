class Study < ApplicationRecord

  belongs_to :researcher

  # has_many :managers, dependent: :nullify
  # has_many :employees, dependent: :nullify

  has_many :manager_participations, foreign_key: :study_id, class_name: 'ManagerParticipation', dependent: :destroy
  has_many :employee_participations, foreign_key: :study_id, class_name: 'EmployeeParticipation', dependent: :destroy

  has_many :managers, through: :manager_participations, source: :manager

  has_many :employees, through: :employee_participations, source: :employee

  has_many :manager_surveys, dependent: :destroy
  has_many :employee_surveys, dependent: :destroy

  has_many :entries, dependent: :destroy

  validates :num_of_managers, presence: true
  validates :num_of_employees, presence: true
  validates :title, presence: true

  def num_of_inactive_managers
    if self.num_of_managers > 0
      inactive_managers = []
      self.managers.each do |mgr|
        num_of_entries = mgr.entries.where(study_id: self.id).count
        if  num_of_entries == 0

          inactive_managers.push(mgr)
        end
      end

      managers_signed_up_inactive = inactive_managers.count
    end
  end

  def num_of_signed_up_managers
    self.managers.count
  end

  def num_of_not_signed_up_managers
    self.num_of_managers - self. num_of_signed_up_managers if self.num_of_managers
  end

  def num_of_active_managers
    self.num_of_signed_up_managers - self.num_of_inactive_managers
  end

  def manager_color_total
    sum = ( num_of_active_managers +
      num_of_inactive_managers +
      num_of_not_signed_up_managers)
  end

  def manager_green_width
    (self.num_of_active_managers / self.manager_color_total)* 100
  end

  def manager_yellow_width
    (self.num_of_inactive_managers / self.manager_color_total) * 100
  end

  def manager_red_width
    ((self.num_of_not_signed_up_managers / self.manager_color_total) * 100)
  end

  def num_of_inactive_employees
    if self.num_of_employees
      inactive_employees = []
      self.employees.each do |mgr|
        num_of_entries = mgr.entries.where(study_id: self.id).count
        if  num_of_entries == 0

          inactive_employees.push(mgr)
        end
      end

      employees_signed_up_inactive = inactive_employees.count
    end
  end

  def num_of_signed_up_employees
    self.employees.count
  end

  def num_of_not_signed_up_employees
    self.num_of_employees - self. num_of_signed_up_employees if self.num_of_employees
  end

  def num_of_active_employees
    self.num_of_signed_up_employees - self.num_of_inactive_employees
  end

  def employee_color_total
    ( self.num_of_active_employees +
      self.num_of_inactive_employees +
      self.num_of_not_signed_up_employees)
  end

  def employee_green_width
    (self.num_of_active_employees / self.employee_color_total) * 100
  end

  def employee_yellow_width
    (self.num_of_inactive_employees / self.employee_color_total) * 100
  end

  def employee_red_width
    (self.num_of_not_signed_up_employees / self.employee_color_total) * 100
  end

  def last_response
    if self.entries.count > 0
      last_entry = self.entries.order(created_at: :desc).first
      last_entry.created_at.strftime("%d %b. %Y")
    else
       "--"
    end
  end

end
