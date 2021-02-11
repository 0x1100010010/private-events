class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.time :start_time
      t.time :end_time
      t.date :date

      t.timestamps
    end
  end
end
