class CreateVendas < ActiveRecord::Migration[8.0]
  def change
    create_table :vendas do |t|
      t.integer :remedio_id, null: false
      t.integer :atendente_id, null: false
      t.string :valor
      t.string :quantidade

      t.timestamps
    end

    # Adicionando as chaves estrangeiras
    add_foreign_key :vendas, :remedios, column: :remedio_id, primary_key: :idRemedio
    add_foreign_key :vendas, :atendentes, column: :atendente_id, primary_key: :idAtendente
  end
end
