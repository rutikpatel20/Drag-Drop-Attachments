class RemoveCoverPageFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :cover_page
  end
end
