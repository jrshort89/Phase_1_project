class CreateUserBeerTable < ActiveRecord::Migration[6.0]
  def change
    create_table :user_beers do |t|
      t.boolean :has_tried
    end
  end
end
