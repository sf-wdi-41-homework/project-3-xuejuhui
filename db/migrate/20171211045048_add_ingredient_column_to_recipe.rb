class AddIngredientColumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :ingredient, :string, array: true, default: '{}'
  end
end
