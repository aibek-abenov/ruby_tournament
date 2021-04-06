class CreateFinalStats < ActiveRecord::Migration[6.0]
  def change
    create_table :final_stats do |t|
      t.string :team
      t.integer :win
      t.integer :loss
      t.boolean :is_winner

      t.timestamps
    end
  end
end
