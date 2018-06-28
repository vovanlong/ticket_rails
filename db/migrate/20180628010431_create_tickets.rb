class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
	  t.text :description
	  t.datetime :ticket_start_date
	  t.datetime :ticket_end_date
	  t.integer :events_id
	  t.integer :ticket_total
      t.timestamps
    end
  end
end
