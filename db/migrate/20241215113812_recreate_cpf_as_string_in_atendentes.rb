class RecreateCpfAsStringInAtendentes < ActiveRecord::Migration[8.0]
  def change
    remove_column :atendentes, :CPF, :integer
    add_column :atendentes, :CPF, :string
  end
end
