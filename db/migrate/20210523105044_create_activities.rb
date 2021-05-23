class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.text :research
      t.text :ppt
      t.text :script
      t.string :attachment

      t.timestamps
    end
  end
end
