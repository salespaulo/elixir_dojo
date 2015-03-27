for n <- [1,2,3,4,5,6], do: n*n
for n <- 10..20, do: n*n
for {:b, n} <- [a: 1, b: 2, b: 3], do: n*n
for {:a, n} <- %{a: 1, b: 2, a: 3}, do: n*n

defmodule User do
	defstruct name: "", age: 0

	def calc_age() do
		p = %User{name: "paulo", age: 31}
		s = %User{name: "sofia", age: 30}
		r = %{s | name: "rodrigo"}
		q = %User{name: "qualquer", age: 99}

		ss = %{s | age: 18}

		usuarios = [p, s, r, q, ss]

		# Mult only age of list to struct User
		c_age = for %User{name: _, age: n} <- usuarios, do: n+n
		IO.puts inspect c_age

		# Using filter by name == 'sofia'
		c_age = for %User{name: n, age: a} <- usuarios, n == "sofia", do: a
		IO.puts inspect c_age
	end
end

defimpl Collectable, for: User do
	def into(c) do
		c
	end
end

User.calc_age

dirs = ["teste1", "teste2"]

for dir <- dirs,
	file <- File.ls!(dir), # return a enumerable and for it
	path = Path.join(dir, file),
#	File.regular?(path), do: File.rm!(path) # or
	File.regular?(path) do 
		File.rm!(path)
	end

# comprehension <- generator, filter, do:
for n <- [1,2,3,4,5,6], rem(n, 2) == 0, do: n

without_into = for {key, val} <- %{"a" => 1, "b" => 2}, do: {key, val * val}
IO.puts inspect without_into

# with return convert into: %{}, map, only struct that implement Collectable 
with_into = for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: {key, val * val}
IO.puts inspect with_into

# Stream are both Enumerable and Collectable implementation
# execute this in iex, but after execute you go need abort iex :D
#iex>  for line <- stream, into: stream, do: String.upcase(line) <> "\n"