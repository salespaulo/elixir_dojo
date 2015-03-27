defmodule Annot do
	@vsn 1

	@test_constant "Paulo #{1234}"
	
	def print(msg), do: IO.puts "#{@test_constant} #{msg}"
end

Annot.print "annotation"