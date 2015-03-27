defmodule User do
	defstruct name: "", age: 0

	def print() do
		paulo = %User{name: "paulo", age: 31}
		sofia = %User{name: "sofia", age: 30}

		rodrigo = %{sofia | name: "rodrigo"}

		IO.puts inspect paulo
		IO.puts inspect sofia
		IO.puts inspect rodrigo

		IO.puts paulo.__struct__
	end
end

User.print