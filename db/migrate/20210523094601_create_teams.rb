class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :t_name
      t.string :c_name
      t.string :p_name

      t.timestamps
    end
  end
end
