class Swipe < ApplicationRecord
	belongs_to :swiper, foreign_key: "swiper_id", class_name: "Pet"
	belongs_to :swipee, foreign_key: "swipee_id", class_name: "Pet"
end
