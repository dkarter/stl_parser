# StlParser

Parses ASCII STL files into Elixir structs

## Usage

```elixir
"./sample_files/DuckCallReed.stl" 
|> File.read!()
|> StlParser.parse_ascii()
```
