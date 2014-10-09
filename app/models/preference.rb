class Preference < ActiveRecord::Base
  validates :like, presence: true
  validates :dislike, presence: true
end
