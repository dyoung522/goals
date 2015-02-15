class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.string :name
      t.references :user

      t.timestamps null: false
    end

    create_join_table :address_books, :contacts
  end
end
