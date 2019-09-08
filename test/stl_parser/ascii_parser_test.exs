defmodule StlParser.AsciiParserTest do
  use ExUnit.Case

  alias StlParser.AsciiParser

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
  solid ascii
    facet normal -9.408238e-001 -1.914896e-001 2.796111e-001
      outer loop
        vertex   -6.134457e+001 -7.433307e+000 2.008728e+000
        vertex   -6.145067e+001 -7.163587e+000 1.836435e+000
        vertex   -6.133515e+001 -7.606451e+000 1.921831e+000
      endloop
    endfacet
  endsolid
  """

  @ast [
    {{{:defsolid, 1, 'solid'}, {:keyword, 1, 'ascii'}},
     [
       {{{:deffacet, 2, 'facet'}, {:keyword, 2, 'normal'},
         [
           {:float, 2, -0.9404168},
           {:float, 2, -0.1896709},
           {:float, 2, 0.2822076}
         ]},
        {{:defouterloop, 3, 'outer loop'},
         [
           {{:defvertex, 4, 'vertex'},
            [
              {:float, 4, -61.40086},
              {:float, 4, -7.154176},
              {:float, 4, 2.008728}
            ]},
           {{:defvertex, 5, 'vertex'},
            [
              {:float, 5, -61.45067},
              {:float, 5, -7.163587},
              {:float, 5, 1.836435}
            ]},
           {{:defvertex, 6, 'vertex'},
            [
              {:float, 6, -61.34457},
              {:float, 6, -7.433307},
              {:float, 6, 2.008728}
            ]}
         ]}}
     ]},
    {{{:defsolid, 10, 'solid'}, {:keyword, 10, 'ascii'}},
     [
       {{{:deffacet, 11, 'facet'}, {:keyword, 11, 'normal'},
         [
           {:float, 11, -0.9408238},
           {:float, 11, -0.1914896},
           {:float, 11, 0.2796111}
         ]},
        {{:defouterloop, 12, 'outer loop'},
         [
           {{:defvertex, 13, 'vertex'},
            [
              {:float, 13, -61.34457},
              {:float, 13, -7.433307},
              {:float, 13, 2.008728}
            ]},
           {{:defvertex, 14, 'vertex'},
            [
              {:float, 14, -61.45067},
              {:float, 14, -7.163587},
              {:float, 14, 1.836435}
            ]},
           {{:defvertex, 15, 'vertex'},
            [
              {:float, 15, -61.33515},
              {:float, 15, -7.606451},
              {:float, 15, 1.921831}
            ]}
         ]}}
     ]}
  ]

  describe ".parse" do
    test "parses ascii file to it's corresponding ast" do
      assert {:ok, parsed_ast} = AsciiParser.parse(@ascii)
      assert parsed_ast == @ast
    end

    test "parses single line ascii file to it's corresponding ast" do
      assert {:ok, _parsed_ast} =
               @ascii
               |> String.split("\n")
               |> Enum.join(" ")
               |> AsciiParser.parse()
    end
  end
end
