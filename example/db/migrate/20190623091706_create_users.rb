class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :uuid, null: false
      t.string :username
      t.string :email, null: false
      t.string :password, null: false
    end
    execute 'ALTER TABLE users ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP'
    execute 'ALTER TABLE users ADD last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
  end
  def down
    drop_table :users
  end
end
