class Lab < ActiveRecord::Base
  has_many :favorite
  belong_to :teacher
  belong_to :place
end
