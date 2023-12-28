# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pessoa, type: :model do
  context 'Given a Pessoa exists' do
    it 'creates a new pessoa with valid attributes' do
      expect(pessoa).to be_valid
    end

    it 'returns an error for invalid attributes' do
      pessoa_duplicate = Pessoa.create(
        apelido: 'josé',
        nome: 'José Roberto',
        nascimento: '2000-10-01',
        stack: ['C#', 'Node', 'Oracle']
      )

      expect(pessoa_duplicate).to_not be_valid
    end
  end

  context 'When finding a Pessoa' do
    context '#show' do
      it 'returns details of an existing pessoa' do
        pessoa_found = Pessoa.find_by(apelido: 'josé')
        expect(pessoa_found).to eq(pessoa)
      end

      it 'returns nil for non-existing pessoa' do
        pessoa_found = Pessoa.find_by(apelido: 'maria')
        expect(pessoa_found).to be_nil
      end
    end
  end

  context 'When searching for Pessoas' do
    context '#index' do
      it 'returns matching pessoas for a search term' do
        pessoa1 = Pessoa.create(
          apelido: 'josé',
          nome: 'José Roberto',
          nascimento: '2000-10-01',
          stack: ['C#', 'Node', 'Oracle']
        )
        pessoa2 = Pessoa.create(
          apelido: 'ana',
          nome: 'Ana Barbosa',
          nascimento: '1985-09-23',
          stack: %w[Node Postgres]
        )

        pessoas_found = Pessoa.search('Node')
        expect(pessoas_found).to include(pessoa1, pessoa2)
      end

      it 'returns empty array for non-matching search term' do
        pessoas_found = Pessoa.search('Python')
        expect(pessoas_found).to be_empty
      end
    end
  end
end
