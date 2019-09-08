defmodule StlParser.ASTParser do
  alias StlParser.Facet
  alias StlParser.Solid
  alias StlParser.Vertex

  def parse(ast) do
    {:ok, ast |> Enum.map(&parse_solid/1)}
  end

  defp parse_solid(solid) do
    {{{:defsolid, _, _}, {:keyword, _, type}}, facets} = solid
    %Solid{type: type |> IO.chardata_to_string(), facets: parse_facets(facets)}
  end

  defp parse_facets(facets), do: Enum.map(facets, &parse_facet/1)

  defp parse_facet(facet) do
    {{{:deffacet, _, _}, {:keyword, _, type}, coordinates}, contents} = facet

    %Facet{
      type: type |> IO.chardata_to_string()
    }
    |> Map.merge(parse_coordinates(coordinates))
    |> Map.merge(parse_facet_contents(contents))
  end

  defp parse_coordinates(coordinates) do
    [x, y, z] =
      coordinates
      |> Enum.map(fn {:float, _, value} -> value end)

    %{x: x, y: y, z: z}
  end

  defp parse_facet_contents(contents) do
    {{:defouterloop, _, _}, vertices} = contents
    %{vertices: parse_vertices(vertices)}
  end

  defp parse_vertices(vertices), do: Enum.map(vertices, &parse_vertex/1)

  defp parse_vertex(vertex) do
    {{:defvertex, _, _}, coordinates} = vertex
    struct!(Vertex, parse_coordinates(coordinates))
  end
end
