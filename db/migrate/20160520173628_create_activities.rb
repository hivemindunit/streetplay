class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :date_time
      t.text :description
      t.integer :duration_h
      t.integer :duration_m
      t.integer :owner_id
      t.belongs_to :activity_type, index: true

      t.timestamps
    end
    add_foreign_key :activities, :users, column: :owner_id
    add_index :activities, :owner_id
  end
end
