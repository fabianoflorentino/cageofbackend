# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::API
  def index
    termo = params[:t]
    if termo.present?
      pessoas = Pessoa.where("to_tsvector('portuguese', coalesce(apelido, '') || ' ' || coalesce(nome, '') || ' ' || coalesce(stack, '')) @@ to_tsquery('portuguese', ?)", termo).limit(50)
      render json: pessoas.map { |pessoa| pessoa_json(pessoa) }, status: :ok
    else
      render json: { error: 'Parâmetro t não foi fornecido' }, status: :bad_request
    end
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)

    if pessoa.save!
      render json: { id: @pessoa.id }, status: :created, location: pessoa_url(@pessoa)
    else
      render json: @pessoa.errors, status: :unprocessable_entity
    end
  end

  private

  def pessoa_params
    params.require(:pessoa).permit(:apelido, :nome, :nascimento, stack: [])
  end
end
