class ExamQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :exam
  belongs_to :answer, class_name: "Alternative", foreign_key: "answer_id"

  default_scope {order('id ASC')}
end
