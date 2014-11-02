class CreateMakers < ActiveRecord::Migration
  def change
    create_table :makers do |t|
      t.string :name
      t.references :division, index: true
      t.integer :identifier

      t.timestamps
    end
  end
end
