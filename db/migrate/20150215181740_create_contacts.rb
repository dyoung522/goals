class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string  :name
      t.string  :email
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
