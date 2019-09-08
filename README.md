# StlParser

Parses ASCII STL files into Elixir structs

## Usage

```elixir
"file.stl"
|> File.read!()
|> StlParser.parse_ascii()
```
