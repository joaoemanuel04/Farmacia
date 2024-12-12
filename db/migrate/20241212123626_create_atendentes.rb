class CreateAtendentes < ActiveRecord::Migration[8.0]
  def change
    create_table :atendentes, id: false do |t|
      t.primary_key :idAtendente, :integer, null: false
      t.string :Nome
      t.integer :CPF
      t.date :dt_nasce

      t.timestamps
    end
  end
end
