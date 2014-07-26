class DropTableRetwets < ActiveRecord::Migration
  def change
  	drop_table :retwets
  end
end
