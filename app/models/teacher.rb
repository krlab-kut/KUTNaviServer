class Teacher < ActiveRecord::Base
  has_many :lab, foreign_key: :teacher_id
end
