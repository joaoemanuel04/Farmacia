class CreateRemedios < ActiveRecord::Migration[8.0]
  def change
    create_table :remedios, id: false do |t|
      t.primary_key :idRemedio, :integer, null: false
      t.string :Remediocol
      t.string :fabricante
      t.string :tipo
      t.float :preco

      t.timestamps
    end
  end
end

