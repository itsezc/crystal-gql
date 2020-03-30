require "./language/lexer"
require "./language/nodes"
require "./language/parser"
require "./language/generation"

module GraphQL::Language
  def self.parse(query_string, options = NamedTuple.new) : GraphQL::Language::Document
    GraphQL::Language::Parser.new(
      GraphQL::Language::Lexer.new
    ).parse(query_string)
  rescue e
    raise e
  end
end