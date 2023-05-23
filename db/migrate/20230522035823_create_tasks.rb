class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.boolean :status
      t.references :user, null: true, foreign_key: true
      t.references :group, null: true, foreign_key: true

      t.timestamps
    end
  end
end
