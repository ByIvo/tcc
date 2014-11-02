class RemoveNameFromExam < ActiveRecord::Migration
  def change
    remove_column :exams, :name, :string
  end
end
