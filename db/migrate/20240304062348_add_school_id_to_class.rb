class AddSchoolIdToClass < ActiveRecord::Migration[7.0]
  def change
    add_column :classes, :school_id, :bigint
    add_index :classes, :school_id
  end
end
