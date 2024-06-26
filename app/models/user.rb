class User < ApplicationRecord
  has_many :incomes
  has_many :outcomes
  has_many :wants
  has_many :income_categories
  has_many :outcome_categories, dependent: :destroy
  accepts_nested_attributes_for :outcome_categories

  validates :name, presence: true
  validates :role, inclusion: {in: [true, false]}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def social_profile(provider)
    social_profiles.find_by(provider: provider.to_s)
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    self.name = info["name"]
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  def admin?
    role == true
  end
end