Nonterminals  solid solids solid_contents facet loop vertices vertex.
Terminals defvertex keyword float defouterloop endloop defsolid endsolid deffacet endfacet.
Rootsymbol solids.

solids -> solid : ['$1'].
solids -> solid solids : ['$1'|'$2'].

solid -> defsolid keyword endsolid : {{'$1', '$2'}, []}.
solid -> defsolid keyword solid_contents endsolid : {{'$1', '$2'}, '$3'}.

solid_contents -> facet : ['$1'].
solid_contents -> facet solid_contents : ['$1'|'$2'].

facet -> deffacet keyword float float float endfacet : {{'$1', '$2', ['$3', '$4', '$5']}}.
facet -> deffacet keyword float float float loop endfacet : {{'$1', '$2', ['$3', '$4', '$5']}, '$6'}.

loop -> defouterloop endloop : {'$1', []}.
loop -> defouterloop vertices endloop : {'$1', '$2'}.

vertices -> vertex : ['$1'].
vertices -> vertex vertices : ['$1'|'$2'].

vertex -> defvertex float float float : {'$1', ['$2', '$3', '$4']}.

Erlang code.
