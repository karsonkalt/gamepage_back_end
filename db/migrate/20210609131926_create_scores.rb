class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.belongs_to :user, null: false, foreign_key: {on_delete: :cascade}
      t.integer :points

      t.timestamps
    end
  end
end
