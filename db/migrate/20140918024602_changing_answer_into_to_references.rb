class ChangingAnswerIntoToReferences < ActiveRecord::Migration
  def up
	backup_ids = {}

  	ExamQuestion.all.each do |question|
		backup_ids[question.id]=question.answer
	end

	remove_column :exam_questions, :answer
	add_column :exam_questions, :answer_id, :integer
	add_index :exam_questions, :answer_id

	ExamQuestion.all.each do |question|
		question.answer_id = backup_ids[question.id]
		question.save
	end
  end

end
