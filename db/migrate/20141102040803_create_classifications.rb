class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :name
      t.references :father, index: true

      t.timestamps
    end
  end
end
