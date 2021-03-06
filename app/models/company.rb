class Company < ApplicationRecord

  has_many :jobs, dependent: :destroy
  has_many :applications, through: :jobs, dependent: :destroy
  has_many :applicants, through: :applications, source: :user

  belongs_to :creator, class_name:"User", foreign_key:"creator_id"

  validates :name, presence: true, uniqueness: true
  validates :industry, presence: true



end
