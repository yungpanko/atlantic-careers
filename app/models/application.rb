class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates_uniqueness_of :user, :scope => :job

end
