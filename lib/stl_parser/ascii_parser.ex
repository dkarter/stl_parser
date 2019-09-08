defmodule StlParser.AsciiParser do
  def parse(ascii) do
    case tokenize(ascii) do
      {:ok, tokens, _} -> :stl_parser.parse(tokens)
      error -> error
    end
  end

  defp tokenize(ascii) do
    ascii
    |> to_charlist()
    |> :stl_lexer.string()
  end
end
