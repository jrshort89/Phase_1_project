class AddIdsToUserBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :user_beers, :user_id, :integer
    add_column :user_beers, :beer_id, :integer
  end
end
