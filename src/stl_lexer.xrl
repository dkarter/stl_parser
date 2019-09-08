Definitions.

SOLID      = solid
ENDSOLID   = endsolid
FACET      = facet
ENDFACET   = endfacet
OUTERLOOP  = outer\s+loop
ENDLOOP    = endloop
VERTEX     = vertex
KEYWORD    = [A-Za-z\w]+
FLOAT      = [\-]?[0-9]+\.?[0-9]*(e(\+|-)[0-9]+)?
WHITESPACE = [\s\t\n\r]

Rules.

{SOLID}       : {token, {defsolid, TokenLine, TokenChars}}.
{ENDSOLID}    : {token, {endsolid, TokenLine, TokenChars}}.
{FACET}       : {token, {deffacet, TokenLine, TokenChars}}.
{ENDFACET}    : {token, {endfacet, TokenLine, TokenChars}}.
{OUTERLOOP}   : {token, {defouterloop, TokenLine, TokenChars}}.
{ENDLOOP}     : {token, {endloop, TokenLine, TokenChars}}.
{VERTEX}      : {token, {defvertex, TokenLine, TokenChars}}.
{KEYWORD}     : {token, {keyword, TokenLine, TokenChars}}.
{FLOAT}       : {token, {float, TokenLine, list_to_float(TokenChars)}}.
{WHITESPACE}+ : skip_token.

Erlang code.
