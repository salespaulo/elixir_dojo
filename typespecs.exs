defmodule CalcTypeSpec do
	@type animated_return :: {number, String.t}

	@spec add(number, number) :: number
	def add(x, y), do: x + y

	@spec add_a(number, number) :: animated_return
	def add_a(x, y), do: { add(x, y), "Return with animated alksdjflajsdlkfalskdj" }
end

defmodule PoliteCalc do
	@spec add(number, number) :: number
	def add(x, y), do: make_polite(CalcTypeSpec.add_a(x, y))

	@spec make_polite(CalcTypeSpec.animated_return) :: number
	defp make_polite({return, _msg}), do: return 
end

IO.puts inspect CalcTypeSpec.add 10, 10
IO.puts inspect CalcTypeSpec.add_a 10, 10

IO.puts inspect PoliteCalc.add 50, 50