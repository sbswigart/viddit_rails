class RenameTypeToContentTypeOnVideos < ActiveRecord::Migration
  def change
  	rename_column :videos, :type, :content_type
  end
end
