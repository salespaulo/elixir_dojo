defmodule MyError do
	defexception message: "My error message", param: "param"
end

try do
	raise "throw raise in code"
rescue
	e in RuntimeError -> IO.puts inspect e
end

try do
	raise ArgumentError, message: "param 1"
rescue
	e in ArgumentError -> IO.puts inspect e
end

try do
	raise MyError
rescue
	e in MyError -> IO.puts inspect e
end	

try do
	raise MyError, message: "Other my error message"

rescue
	e in MyError -> IO.puts inspect e
end

try do
	raise MyError, param: "Other my error param"
rescue
	e in MyError -> IO.puts inspect e
end

# Control flow of exceptions, image I needed to find first number divisible for 13
try do
	Enum.each -50..50, fn(x) -> 
		if rem(x,13) == 0, do: throw(x)
	end
	IO.puts "Got nothing"
catch
	x -> IO.puts "Got #{x}"
end

# Exiting a process with return value 1, we can use try,catch
# spawn_link fn -> exit(1) end

try do
	exit "I am exiting"
catch
	:exit, msg -> IO.puts "#{msg}, but not really"
end

{:ok, file} = File.open "touch.file", [:utf8, :write]

try do
	IO.write file, "testestes"
	raise "Something went wrong"
after
	File.close(file)
end
