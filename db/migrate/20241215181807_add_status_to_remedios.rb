class AddStatusToRemedios < ActiveRecord::Migration[8.0]
  def change
    add_column :remedios, :status, :string, default: 'ativo', null: false
  end
end
