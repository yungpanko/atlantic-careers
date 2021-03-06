class User < ApplicationRecord
  has_secure_password
  has_many :created_companies, class_name:"Company", foreign_key: "creator_id"
  has_many :applications
  has_many :jobs_applied_to, class_name:"Job", through: :applications, source: :job
  has_many :companies_applied_to, class_name:"Company", through: :jobs_applied_to, source: :company


  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
