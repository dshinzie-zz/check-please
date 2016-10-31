class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
