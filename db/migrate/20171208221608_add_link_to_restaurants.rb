class AddLinkToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :link, :string
  end
end
