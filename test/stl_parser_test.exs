defmodule StlParserTest do
  use ExUnit.Case
  doctest StlParser

  alias StlParser.Solid
  alias StlParser.Facet
  alias StlParser.Vertex

  @ascii """
  solid ascii
    facet normal -9.404168e-001 -1.896709e-001 2.822076e-001
      outer loop
        vertex   -6.140086e+001 -7.154176e+000 2.008728e+000
        vertex   -6.145067e+001 -7.163587e+000 1.836435e+000
        vertex   -6.134457e+001 -7.433307e+000 2.008728e+000
      endloop
    endfacet
  endsolid
  """

  @nested_struct [
    %Solid{
      type: "ascii",
      facets: [
        %Facet{
          type: "normal",
          x: -0.9404168,
          y: -0.1896709,
          z: 0.2822076,
          vertices: [
            %Vertex{
              x: -61.40086,
              y: -7.154176,
              z: 2.008728
            },
            %Vertex{
              x: -61.45067,
              y: -7.163587,
              z: 1.836435
            },
            %Vertex{
              x: -61.34457,
              y: -7.433307,
              z: 2.008728
            }
          ]
        }
      ]
    }
  ]

  describe ".parse_ascii" do
    test "can parse a simple file" do
      assert {:ok, parsed} = StlParser.parse_ascii(@ascii)
      assert parsed == @nested_struct
    end
  end
end
