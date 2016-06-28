class Question < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  has_many :answers, foreign_key: :question_id, dependent: :destroy
end
