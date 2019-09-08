defmodule StlParser.ASTParserTest do
  use ExUnit.Case

  alias StlParser.ASTParser
  alias StlParser.Facet
  alias StlParser.Solid
  alias StlParser.Vertex

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
         ]}},
       {{{:deffacet, 9, 'facet'}, {:keyword, 9, 'normal'},
         [
           {:float, 9, -0.9408238},
           {:float, 9, -0.1914896},
           {:float, 9, 0.2796111}
         ]},
        {{:defouterloop, 10, 'outer loop'},
         [
           {{:defvertex, 11, 'vertex'},
            [
              {:float, 11, -61.34457},
              {:float, 11, -7.433307},
              {:float, 11, 2.008728}
            ]},
           {{:defvertex, 12, 'vertex'},
            [
              {:float, 12, -61.45067},
              {:float, 12, -7.163587},
              {:float, 12, 1.836435}
            ]},
           {{:defvertex, 13, 'vertex'},
            [
              {:float, 13, -61.33515},
              {:float, 13, -7.606451},
              {:float, 13, 1.921831}
            ]}
         ]}}
     ]}
  ]

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
        },
        %Facet{
          type: "normal",
          x: -0.9408238,
          y: -0.1914896,
          z: 0.2796111,
          vertices: [
            %Vertex{
              x: -61.34457,
              y: -7.433307,
              z: 2.008728
            },
            %Vertex{
              x: -61.45067,
              y: -7.163587,
              z: 1.836435
            },
            %Vertex{
              x: -61.33515,
              y: -7.606451,
              z: 1.921831
            }
          ]
        }
      ]
    }
  ]

  describe ".parse" do
    test "parses an ast to it's corresponding nested struct" do
      assert {:ok, nested_struct} = ASTParser.parse(@ast)
      assert nested_struct == @nested_struct
    end
  end
end
