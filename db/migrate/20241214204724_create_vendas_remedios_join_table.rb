class CreateVendasRemediosJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :vendas, :remedios do |t|
      t.index :venda_id
      t.index :remedio_id
    end
  end
end
