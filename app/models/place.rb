class Place < ActiveRecord::Base
  has_many :user
  has_many :lab
  has_many :naruko
end
