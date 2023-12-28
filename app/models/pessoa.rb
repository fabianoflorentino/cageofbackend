# frozen_string_literal: true

# Pessoa
class Pessoa < ApplicationRecord
  validates :apelido, presence: true, uniqueness: true, length: { maximum: 32 }
  validates :nome, presence: true, length: { maximum: 100 }
  validates :nascimento, presence: true
end
