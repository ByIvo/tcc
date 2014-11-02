class AddNameAndIdentifierIndexToMaker < ActiveRecord::Migration
  def change
  	add_index :makers, :identifier, unique: :true
  end
end
