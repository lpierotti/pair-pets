class Message < ApplicationRecord
	belong_to :match
	validates :content, presence: true
end
