class ExamRules < ActiveRecord::Base
  belongs_to :classification
  belongs_to :exam_request
end
