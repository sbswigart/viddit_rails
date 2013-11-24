class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.belongs_to :user, null: false
    	t.belongs_to :vote, null: false
    	t.integer :count, limit: 1
    	
      t.timestamps
    end
  end
end
