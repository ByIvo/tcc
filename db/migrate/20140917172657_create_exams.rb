class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps
    end
  end
end
