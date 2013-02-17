class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.date :start_date
      t.date :end_date
      t.integer :rent
      t.integer :unit_id

      t.timestamps
    end
  end
end
