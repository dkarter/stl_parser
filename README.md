# StlParser

Parses ASCII STL files into Elixir structs uses Erlang's built-in :leex and
:yecc modules for tokenizing and creating an AST.

## Usage

```elixir
"./sample_files/DuckCallReed.stl" 
|> File.read!()
|> StlParser.parse_ascii()
```
