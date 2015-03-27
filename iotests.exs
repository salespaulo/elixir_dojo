IO.puts "ola mundo"
IO.gets "yes or no"

case File.read("arquivo") do
	{:ok, body} -> IO.puts "Body: #{body}"
	{:error, reason} -> IO.puts "Error: #{inspect reason}"
end

Path.join("dir1", "dir2")
Path.expand("~/home")