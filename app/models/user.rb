class User < ActiveRecord::Base
  has_many :favorite, foreign_key: :user_id, dependent: :destroy
  has_many :question, foreign_key: :user_id, dependent: :destroy
  belongs_to :place, foreign_key: :place_id
end
