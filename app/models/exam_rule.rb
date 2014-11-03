class ExamRule < ActiveRecord::Base
  belongs_to :classification
  belongs_to :exam_request

  def to_s
  	"#{classification.name} - #{quantity}"
  end
end
