class ExamRequest < ActiveRecord::Base
	has_many :exam_rules, dependent: :destroy
end
