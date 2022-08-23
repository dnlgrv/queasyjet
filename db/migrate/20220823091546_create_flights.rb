class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :departure_airport
      t.string :arrival_airport

      t.timestamps
    end
  end
end
