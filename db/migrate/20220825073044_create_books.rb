class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :price
      t.string :cover_page

      t.timestamps
    end
  end
end
