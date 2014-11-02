class AddMakerIdToExam < ActiveRecord::Migration
  def change
    add_column :exams, :maker_id, :integer
  end
end
