require_relative 'null_node'

class Parser::Nodes::Node
  attr_reader :type, :value, :consumed
  def initialize(type:, value:, consumed:)
    @type = type
    @value = value
    @consumed = consumed
  end

  def null?
    false
  end

  def present?
    true
  end

  def self.null
    @@null_node ||= Parser::Nodes::NullNode.new
  end
end
