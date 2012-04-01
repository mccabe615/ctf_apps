class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :item_num
      t.string :name
      t.string :price
      t.string :description
      t.string :pic_location

      t.timestamps
    end
  end
end
