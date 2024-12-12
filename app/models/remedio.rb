class Remedio < ApplicationRecord
  validates :Remediocol, presence: true
  validates :fabricante, presence: true
  validates :tipo, presence: true
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :vendas
end

