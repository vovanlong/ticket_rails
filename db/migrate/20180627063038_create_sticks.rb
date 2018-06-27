class CreateSticks < ActiveRecord::Migration[5.2]
  def change
    create_table :sticks do |t|
      t.integer :name
      t.text :describe
      t.integer :events_id

      t.timestamps
    end
  end
end
