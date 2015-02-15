class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :topic
      t.datetime :date_start
      t.datetime :date_due
      t.datetime :date_completed
      t.references :user
      t.references :category

      t.timestamps null: false
    end
  end
end
