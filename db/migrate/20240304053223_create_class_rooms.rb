class CreateClassRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :class_rooms do |t|
      t.integer :number, null: false
      t.string :letter, null: false
      t.integer :students_count, default: 0 , null: false

      t.timestamps
    end
  end
end
