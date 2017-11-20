class CreateVehicleOwnerInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_owner_insurances do |t|
      t.date :start_date
      t.date :end_date
      t.integer :vehicle_id

      t.timestamps null: false
    end
  end
end
