class Atendente < ApplicationRecord
  validates :Nome, presence: true
  validates :CPF, presence: true, format: { with: /\A\d{11}\z/, message: "deve conter exatamente 11 dígitos" }, uniqueness: true
  validates :dt_nasce, presence: true
  has_many :vendas
  belongs_to :user
end
