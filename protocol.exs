defprotocol Blank do
	@fallback_to_any true
	def blank?(data)
end

defimpl Blank, for: Any do
	def blank?(_), do: true
end

defimpl Blank, for: Integer do
	def blank?(0), do: true
	def blank?(_), do: false
end

defimpl Blank, for: List do
	def blank?([]), do: true
	def blank?(_), do: false
end

defimpl Blank, for: Map do
	def blank?(map), do: map_size(map) == 0
end	

defmodule User do
	defstruct name: "", age: 0

	def print() do
		IO.puts Blank.blank?(%User{})
		IO.puts Blank.blank?(%User{name: "paulo"})
	end
end

defimpl Blank, for: User do
	def blank?(%User{name: "", age: 0}), do: true
	def blank?(_), do: false
end

IO.puts Blank.blank?(0)
IO.puts Blank.blank?(5)
IO.puts Blank.blank?([])
IO.puts Blank.blank?([3])

IO.puts Blank.blank?(%{})
IO.puts Blank.blank?(%{test: "dsd"})

User.print

#fallback_to_any enable, for: Any implementation. Valid to struct too
IO.puts Blank.blank?(0.0)
IO.puts Blank.blank?(1.0)