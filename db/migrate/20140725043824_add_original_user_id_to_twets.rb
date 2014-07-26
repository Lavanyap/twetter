class AddOriginalUserIdToTwets < ActiveRecord::Migration
  def change
  	add_column :twets, :original_user_id,:integer
  end
end
