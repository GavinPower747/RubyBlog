class AddColumnToBlogPost < ActiveRecord::Migration
  def up
    add_column :blog_posts, :isPublished, :boolean
  end
  
  def down
    remove_column :blog_posts, :isPublished
  end
end
