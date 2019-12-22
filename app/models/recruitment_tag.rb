class RecruitmentTag < ApplicationRecord
	belongs_to :recruitment
	belongs_to :tag

	acts_as_paranoid
end
