class Remedio < ApplicationRecord
  validates :Remediocol, presence: true
  validates :fabricante, presence: true
  validates :tipo, presence: true
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }

  mount_uploader :imagem, ImagemUploader

  has_and_belongs_to_many :vendas
end

