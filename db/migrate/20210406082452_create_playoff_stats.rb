class CreatePlayoffStats < ActiveRecord::Migration[6.0]
  def change
    create_table :playoff_stats do |t|
      t.string :division
      t.string :team
      t.integer :win
      t.integer :loss
      t.boolean :to_semifinal

      t.timestamps
    end
  end
end
