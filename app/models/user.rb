class User < ActiveRecord::Base
  has_many :favorite, foreign_key: :user_id
  has_many :question, foreign_key: :user_id
  belongs_to :place
end
