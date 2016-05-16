class Lab < ActiveRecord::Base
  has_many :favorite, foreign_key: :lab_id
  belong_to :teacher, foreign_key: :teacher_id
  belong_to :place
end
