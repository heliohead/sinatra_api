class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|

      t.belongs_to :passengers, index: true
      t.belongs_to :cabs, index: true
      t.string :starts_at, null: false
      t.string :ends_at, null: false
      t.time :created_at

      t.timestamps null: false
    end
  end
end
