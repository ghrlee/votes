class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.integer :population
      t.string :name
      t.string :climate
      t.string :terrain
      t.string :flag
      t.string :description
      t.string :anthem
      t.integer :election_period
      t.timestamps null: false
    end
  end
end
