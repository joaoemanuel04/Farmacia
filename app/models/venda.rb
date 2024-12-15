class Venda < ApplicationRecord
  validates :valor, presence: true
  validates :quantidade, presence: true
  belongs_to :atendente
  belongs_to :remedio
  def preco_total
    remedio.preco * quantidade.to_i
  end
end
