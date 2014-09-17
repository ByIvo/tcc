class Exam < ActiveRecord::Base
	has_many :exam_questions, dependent: :destroy
end
