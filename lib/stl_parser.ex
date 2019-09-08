defmodule StlParser do
  alias StlParser.AsciiParser
  alias StlParser.ASTParser

  def parse_ascii(content) do
    case AsciiParser.parse(content) do
      {:ok, ast} -> ASTParser.parse(ast)
      error -> error
    end
  end
end
