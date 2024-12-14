class AddImagemToRemedios < ActiveRecord::Migration[8.0]
  def change
    add_column :remedios, :imagem, :string
  end
end
