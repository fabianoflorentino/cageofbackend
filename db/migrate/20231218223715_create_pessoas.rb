# frozen_string_literal: true

# Create Pessoal
class CreatePessoas < ActiveRecord::Migration[7.0]
  def change
    create_table :pessoas do |t|
      t.string :apelido, limit: 32
      t.string :nome, limit: 100
      t.date :nascimento
      t.text :stack

      t.timestamps
    end
    add_index :pessoas, :apelido, unique: true
  end
end
