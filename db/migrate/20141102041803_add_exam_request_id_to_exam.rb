class AddExamRequestIdToExam < ActiveRecord::Migration
  def change
    add_column :exams, :exam_request_id, :integer
  end
end
