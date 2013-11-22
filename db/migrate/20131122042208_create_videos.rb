class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.belongs_to :user
    	t.string :provider_name
    	t.string :type
    	t.string :thumbnail_width
    	t.string :author_url
    	t.string :html
    	t.string :provider_url
    	t.string :version
    	t.string :thumbnail_height
    	t.string :title
    	t.string :author_name
    	t.string :height
    	t.string :width
    	t.string :thumbnail_url
    	t.string :author_url

      t.timestamps
    end
  end
end
