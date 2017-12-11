class RemoveIngredientColumnFromRecipe < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :ingredient, :string
  end
end
