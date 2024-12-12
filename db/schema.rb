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

ActiveRecord::Schema[8.0].define(version: 2024_12_12_125857) do
  create_table "atendentes", primary_key: "idAtendente", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "Nome"
    t.integer "CPF"
    t.date "dt_nasce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "remedios", primary_key: "idRemedio", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "Remediocol"
    t.string "fabricante"
    t.string "tipo"
    t.float "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "remedio_id", null: false
    t.integer "atendente_id", null: false
    t.string "valor"
    t.string "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atendente_id"], name: "fk_rails_023f45e85a"
    t.index ["remedio_id"], name: "fk_rails_bf0b8d946b"
  end

  add_foreign_key "vendas", "atendentes", primary_key: "idAtendente"
  add_foreign_key "vendas", "remedios", primary_key: "idRemedio"
end
