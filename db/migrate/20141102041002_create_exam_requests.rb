class CreateExamRequests < ActiveRecord::Migration
  def change
    create_table :exam_requests do |t|
      t.string :name

      t.timestamps
    end
  end
end
