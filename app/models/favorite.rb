class Favorite < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :labs, foreign_key: :lad_id
end
