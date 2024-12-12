class Venda < ApplicationRecord
  validates :valor, presence: true
  validates :quantidade, presence: true

  belongs_to :remedio
  belongs_to :atendente
end
