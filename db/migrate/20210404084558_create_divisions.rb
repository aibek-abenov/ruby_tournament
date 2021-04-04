class CreateDivisions < ActiveRecord::Migration[6.0]
  def change
    create_table :divisions do |t|
      t.string :division_name
      t.string :team_name

      t.timestamps
    end
  end
end
