class AddSchoolIdToClass < ActiveRecord::Migration[7.0]
  def change
    add_column :class_rooms, :school_id, :bigint
    add_index :class_rooms, :school_id
  end
end
