class User < ActiveRecord::Base
  has_many :favorite
  has_many :question
  belongs_to :place
end
