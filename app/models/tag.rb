class Tag < ApplicationRecord
	has_many :recruitment_tags
	has_many :recruitments, through: :recruitment_tags
end
