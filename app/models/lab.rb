class Lab < ActiveRecord::Base
  has_many :favorite, foreign_key: :lab_id
  belongs_to :teacher, foreign_key: :teacher_id
  belongs_to :place, foreign_key: :place_id
end
