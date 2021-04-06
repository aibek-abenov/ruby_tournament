class CreateDivisionStats < ActiveRecord::Migration[6.0]
  def change
    create_table :division_stats do |t|
      t.string :division
      t.string :team
      t.integer :win
      t.integer :draw
      t.integer :loss
      t.integer :points

      t.timestamps
    end
  end
end
