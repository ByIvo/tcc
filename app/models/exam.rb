class Exam < ActiveRecord::Base
	has_many :exam_questions, dependent: :destroy
	belongs_to :exam_request
	belongs_to :maker
end
