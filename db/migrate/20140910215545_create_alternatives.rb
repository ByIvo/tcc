class CreateAlternatives < ActiveRecord::Migration
  def change
    create_table :alternatives do |t|
      t.text :title
      t.integer :exibition_type
      t.boolean :correct
      t.references :question, index: true

      t.timestamps
    end
  end
end
