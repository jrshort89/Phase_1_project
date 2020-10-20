class CreateUserTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :location
    end
  end
end
