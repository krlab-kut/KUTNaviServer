class Naruko < ActiveRecord::Base
  belongs_to :place, foreign_key: :place_id
end
