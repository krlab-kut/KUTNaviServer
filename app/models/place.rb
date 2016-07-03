class Place < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :user, foreign_key: :place_id
  has_many :lab, foreign_key: :place_id
  has_many :naruko, foreign_key: :place_id
end
