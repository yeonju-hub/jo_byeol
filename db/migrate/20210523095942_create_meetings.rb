class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.references :team, foreign_key: true
      t.string :schedule
      t.datetime :start_time
      t.string :place

      t.timestamps
    end
  end
end
