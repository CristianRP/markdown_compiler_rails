class Api::V1::GeneratorController < ApplicationController
  def tokenizer
    tokenizer_function = Tokenizer::Tokenizer.new
    if generator_params[:markdown].present?
      render json: tokenizer_function.tokenize(generator_params[:markdown]), status: :ok
    else
      render json: 'Invalid operation'.to_json, status: :not_found
    end
  end

  def parser
    parser_function = Parser::Parser.new
    if generator_params[:tokens].present?
      render json: parser_function.parse(generator_params[:tokens]), status: :ok
    else
      render json: 'Invalid operation'.to_json, status: :not_found
    end
  end

  def generator
    tokenizer_function = Tokenizer::Tokenizer.new
    parser_function = Parser::Parser.new
    generator_function = Generator::Generator.new
    tokens_list = tokenizer_function.tokenize(generator_params[:markdown])
    ast = parser_function.parse(tokens_list)
    render json: { token_list: tokens_list, 
        ast: ast, value: generator_function.generate(ast) }, status: :ok
  end

  private

  def generator_params
    params.permit(:markdown, :ast, :formats, :tokens => [])
  end
end
