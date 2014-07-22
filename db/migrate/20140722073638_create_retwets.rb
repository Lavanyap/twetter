class CreateRetwets < ActiveRecord::Migration
  def change
  	create_table :retwets do |t|
		t.integer :twet_id
 		t.integer :user_id
 		t.timestamps
    end

    add_index :retwets, [:twet_id, :user_id]
   
  end
end
