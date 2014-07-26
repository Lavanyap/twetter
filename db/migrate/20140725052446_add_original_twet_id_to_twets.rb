class AddOriginalTwetIdToTwets < ActiveRecord::Migration
  def change
  	add_column :twets, :original_twet_id,:integer
  end
end
