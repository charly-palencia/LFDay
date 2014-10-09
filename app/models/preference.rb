class Preference < ActiveRecord::Base
  validates :like, :dislike, presence: true, length: { maximum: 255 }
end
