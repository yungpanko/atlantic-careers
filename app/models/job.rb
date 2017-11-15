class Job < ApplicationRecord
  belongs_to :company
  has_many :applications
  has_many :applicants, class_name:"User", through: :applications, source: :user

  validates :title, presence: true
  validates :company, presence: true
  validates :link, presence: true

end
