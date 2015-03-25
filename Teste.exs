defmodule Lista do

	def filtrar(list, func) when is_function(func), do: filtrar(reverse(list), func, [])

	defp filtrar([], _, acumulator), do: acumulator

	defp filtrar([head | tail], func, acumulator) do
		filtrar(tail, func, to_(head, acumulator, func.(head)))
	end

	defp to_(head, acumulator, true), do: [head | acumulator]

	defp to_(_, acumulator, false), do: acumulator

	def reverse(list) do
		reverse(list, [])
	end

	defp reverse([head | tail], acumulator), do: reverse(tail, [head | acumulator])

	defp reverse([], acumulator), do: acumulator

end

l = [1,2,3,4,5,6,7,8,9,10]
IO.puts inspect Lista.reverse l
IO.puts inspect Lista.filtrar l, fn(x) -> rem(x, 2) == 0 end
