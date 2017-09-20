class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.text :bio
      t.string :nationality

      t.timestamps
    end
  end
end
