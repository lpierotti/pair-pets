class Pet < ApplicationRecord
	belongs_to :user
	has_many :swipes
	has_many :matches
	has_many :playdates, through: :matches
	has_many :messages, through: :matches
	validates :name, :breed, :gender, :age, presence: true
end
