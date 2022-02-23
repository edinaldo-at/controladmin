class CreateTbAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :tb_admins do |t|
      t.string :cliente
      t.string :computador, unique: true
      t.string :userlocal
      t.string :senha
      t.string :public_key

      t.timestamps
    end
  end
end
