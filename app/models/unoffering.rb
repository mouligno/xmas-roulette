class Unoffering < ActiveRecord::Base
  validates :user_offering_id, presence: true
  validates :user_not_offering_to, presence: true

  belongs_to :user
end
