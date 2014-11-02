class CreateExamRules < ActiveRecord::Migration
  def change
    create_table :exam_rules do |t|
      t.integer :quantity
      t.references :classification, index: true
      t.references :exam_request, index: true

      t.timestamps
    end
  end
end
