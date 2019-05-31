require_relative 'base_parser'

class TextParser < BaseParser
  def match(tokens)
    return Parser::Nodes::Node.null unless tokens.peek('TEXT')
    Parser::Nodes::Node.new(type: 'TEXT', value: tokens.first.value, consumed: 1)
  end
end
