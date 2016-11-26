class Researcher < User
  has_many :studies, dependent: :destroy


end
