class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :price
      t.string :category
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
