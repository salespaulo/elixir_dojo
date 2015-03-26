defmodule Recursion do
	def print_s(msg, n) when n == 1 or n == 0 do
		IO.puts msg
	end

	def print_s(msg, n) when n < 0 do
		n = abs(n)
		print_s(msg, n)
	end

	def print_s(msg, n) do
		IO.puts msg
		print_s msg, n - 1
	end
end

Recursion.print_s "Hello", 0
Recursion.print_s "Hello", 1
Recursion.print_s "Hello", 2
Recursion.print_s "Hello", -3