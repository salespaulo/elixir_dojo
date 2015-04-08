# Behaviour is like interfaces in Java
defmodule Parser do
	use Behaviour

	defcallback parse(String.t) :: any
	defcallback extensions() :: String.t

end

defmodule JSONParser do
	@behaviour Parser

	def parse(str), do: IO.puts "Parsing JSON #{str}"
	def extensions(), do: IO.puts ["json"]
end

JSONParser.parse "usuarios: {usuario: {id: 1, name: \"lala\"}}"