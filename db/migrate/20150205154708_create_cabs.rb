class CreateCabs < ActiveRecord::Migration
  def change
    create_table :cabs do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0
      t.time :created_at
      t.time :updated_at

      t.timestamps null: false
    end
  end
end
