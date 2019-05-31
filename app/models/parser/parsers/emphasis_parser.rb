# frozen_string_literal: true

require_relative 'base_parser'

class EmphasisParser < BaseParser
  def match(tokens)
    return Parser::Nodes::Node.null unless tokens.peek_or(%w[UNDERSCORE TEXT UNDERSCORE], %w[STAR TEXT STAR])

    Parser::Nodes::Node.new(type: 'EMPHASIS', value: tokens.second.value, consumed: 3)
  end
end
