# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_218_223_715) do
  create_table 'pessoas', charset: 'utf8mb4', collation: 'utf8mb4_unicode_ci', force: :cascade do |t|
    t.string 'apelido', limit: 32
    t.string 'nome', limit: 100
    t.date 'nascimento'
    t.text 'stack'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['apelido'], name: 'index_pessoas_on_apelido', unique: true
  end
end
