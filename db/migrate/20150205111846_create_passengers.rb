class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :address
      t.float :longitude
      t.float :latitude
      t.time :created_at
      t.time :updated_at

      t.timestamps null: false
    end
  end
end

