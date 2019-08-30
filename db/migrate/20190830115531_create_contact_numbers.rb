class CreateContactNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_numbers do |t|
      t.integer :number

      t.timestamps
    end
  end
end
