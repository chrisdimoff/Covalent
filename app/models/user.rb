class User < ApplicationRecord


  has_secure_password

  serialize :oauth_raw_data, Hash

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX,
                    unless: :from_oath?
  def self.find_from_oauth(oauth_data)

    User.where(provider: oauth_data['provider'],
               uid:      oauth_data['uid']).first
  end

    def self.create_from_oauth(oauth_data)
      full_name = oauth_data['info']['name'].split
      user = User.create first_name:     full_name[0],
                      last_name:      full_name[1],
                      email:          oauth_data['info']['email'],
                      password:       SecureRandom.hex(32),
                      provider:       oauth_data['provider'],
                      uid:            oauth_data['uid'],
                      oauth_token:    oauth_data['credentials']['token'],
                      oath_secret:    oauth_data['credentials']['secret'],
                      oath_raw_data:  oauth_data


    end

    def full_name
      "#{first_name} #{last_name}".strip.squeeze(' ').titleize
    end

    def researcher?
      self.type.downcase == "researcher" ? true : false
    end
    def manager?
      self.type.downcase == "manager" ? true : false
    end
    def employee?
      self.type.downcase == "employee" ? true : false
    end

    private

    def downcase_email
      self.email.downcase! if email.present?
    end

    def from_oath?
      provider.present? && uid.present?
    end


end
