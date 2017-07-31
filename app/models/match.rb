class Match < ApplicationRecord
	belongs_to :pet
	has_many :messages
	has_many :playdates
end
