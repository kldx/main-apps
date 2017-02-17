class User < ApplicationRecord
  enum role: [:user, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  attr_accessor :login, :avatar_url

  has_many :articles

  validates :callsign,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
  }
  validate :validate_callsign

  def validate_callsign
    if User.where(email: callsign).exists?
      errors.add(:callsign, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(callsign) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:callsign].nil?
        where(conditions).first
      else
        where(callsign: conditions[:callsign]).first
      end
    end
  end
end
