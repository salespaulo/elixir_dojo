defmodule KeyValue do
	def start do
		Task.start_link(fn -> loop(%{}) end)
	end

	def loop(map) do
		receive do
			{:put, key, value} ->
				loop(Map.put(map, key, value))
			{:get, key, caller} ->
				send(caller, {key, Map.get(map, key)})
				loop(map)
		end
	end
end


defmodule R do
	def start do
		Task.start_link(fn -> loop_r() end)
	end

	def loop_r do
		receive do
			{:db_name, value} -> IO.puts value
			{:db_host, value} -> IO.puts value
			{:db_port, value} -> IO.puts value
			{:status, value} -> IO.puts value
		end

		loop_r()
	end

end

{:ok, pid_kv} = KeyValue.start
{:ok, pid_r} = R.start

Process.register(pid_kv, :kv)
Process.register(pid_r, :r)

send(:kv, {:put, :db_name, "mongodb"})
send(:kv, {:put, :db_host, "10.0.12.212"})
send(:kv, {:put, :db_port, 123})
send(:kv, {:put, :status, "ativo"})

send(:kv, {:get, :db_name, :r})
send(:kv, {:get, :db_host, :r})
send(:kv, {:get, :db_port, :r})
send(:kv, {:get, :status, :r})

{:ok, pid_a} = Agent.start_link(fn -> %{} end)
Process.register(pid_a, :agent_pid)

Agent.update(:agent_pid, fn(map) -> Map.put(map, :db_name, "mongodb") end)
Agent.update(:agent_pid, fn(map) -> Map.put(map, :db_host, "10.0.12.212") end)
Agent.update(:agent_pid, fn(map) -> Map.put(map, :db_port, 123) end)

IO.puts Agent.get(:agent_pid, fn(map) -> Map.get(map, :db_name) end)
IO.puts Agent.get(:agent_pid, fn(map) -> Map.get(map, :db_host) end)
IO.puts Agent.get(:agent_pid, fn(map) -> Map.get(map, :db_port) end)
