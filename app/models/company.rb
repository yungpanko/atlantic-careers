class Company < ApplicationRecord

  has_many :jobs
  has_many :applications, through: :jobs
  has_many :applicants, through: :applications
  
  belongs_to :creator, class_name:"User", foreign_key:"creator_id"

  validates :name, presence: true, uniqueness: true
  validates :industry, presence: true



end
