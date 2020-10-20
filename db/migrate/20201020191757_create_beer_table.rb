class CreateBeerTable < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :description
      t.string :cat_name
      t.string :country
      t.integer :abv
    end
  end
end
