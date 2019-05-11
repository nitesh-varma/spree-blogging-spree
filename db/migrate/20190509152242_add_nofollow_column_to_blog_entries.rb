class AddNofollowColumnToBlogEntries < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_blog_entries, :nofollow, :boolean, default: false
  end
end
