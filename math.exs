defmodule Math2 do
	def sum a, b do
		a + b
	end

	def zero?(0), do: true

	def zero?(n) when is_number(n) do
		false
	end

	def sum_list([]), do: 0

	def sum_list(list) when is_list(list) do
		sum_list list, 0
	end

	defp sum_list([], acumulator), do: acumulator

	defp sum_list([head | tail], acumulator) do
		sum_list(tail, head + acumulator)
	end	 

	def double_each([head | tail]) do
		[head * 2 | double_each(tail)]
	end

	def double_each([]), do: []
end

IO.puts Math2.sum_list [1,2,3]
IO.puts inspect Math2.double_each ([1,2,3])
# It's the same
IO.puts Enum.reduce [1,2,3], fn x, acc -> x + acc end
IO.puts inspect Enum.map [1,2,3], fn x -> x * 2 end 
# Using capture syntax
IO.puts Enum.reduce [1,2,3], &+/2 #Passing sum function with parameter, incredible!
IO.puts inspect Enum.map [1,2,3], &(&1 * 2) #Passing function reference of multiplication statement, incredible