class CreateUhts < ActiveRecord::Migration[5.2]
  def change
    create_table :uhts do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
