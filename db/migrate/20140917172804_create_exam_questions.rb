class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.references :question, index: true
      t.integer :answer
      t.datetime :answer_date
      t.references :exam, index: true

      t.timestamps
    end
  end
end
