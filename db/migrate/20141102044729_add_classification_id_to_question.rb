class AddClassificationIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :classification_id, :integer
  end
end
