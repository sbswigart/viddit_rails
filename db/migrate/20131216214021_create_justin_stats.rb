class CreateJustinStats < ActiveRecord::Migration
  def change
    create_table :justin_stats do |t|
    	t.integer :viewers_count
    	t.integer :streams_count
      t.timestamps
    end
  end
end
