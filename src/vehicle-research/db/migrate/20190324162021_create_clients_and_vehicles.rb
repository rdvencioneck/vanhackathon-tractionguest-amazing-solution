class CreateClientsAndVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    create_table :vehicles do |t|
      t.string :plate
      t.string :brand
      t.string :model
      t.integer :model_year
      t.string :color

      t.timestamps
    end

    create_table :clients_vehicles, id: false do |t|
      t.belongs_to :client, index: true
      t.belongs_to :vehicle, index: true

      t.timestamps
    end
  end
end
