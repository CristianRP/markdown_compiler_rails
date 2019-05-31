require_relative "base_parser"
#require_relative "concerns/matches_star"

class BodyParser < BaseParser
  include MatchesStar

  def match(tokens)
    nodes, consumed = match_star tokens, with: paragraph_parser
    return Parser::Nodes::Node.null if nodes.empty?
    Parser::Nodes::BodyNode.new(paragraphs: nodes, consumed: consumed)
  end
end
