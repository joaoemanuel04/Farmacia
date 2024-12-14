class Venda < ApplicationRecord
  validates :valor, presence: true
  validates :quantidade, presence: true
  belongs_to :atendente
  has_and_belongs_to_many :remedios

  def preco_total
    remedio.preco * quantidade.to_i
  end
end
