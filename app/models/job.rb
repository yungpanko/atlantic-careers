class Job < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_many :applicants, class_name:"User", through: :applications, source: :user
  belongs_to :creator, class_name:"User", foreign_key:"creator_id"

  validates :title, presence: true
  validates :company, presence: true
  validates :link, presence: true
  validates :location, presence: true

end
