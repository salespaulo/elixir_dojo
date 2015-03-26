# This process
#spid = self()
#IO.puts "self pid #{inspect spid}"
# Spawning function execute in process pid
#pid = spawn fn -> 1 + 1 end
#IO.puts inspect pid
# Verify if process is alive
#IO.puts inspect Process.alive? pid

# Get PID to this process
#parent = self()
# Spawning function execute send message to this process with PID of this spawn(other process)
#spawn fn -> send parent, {:hello, self()} end

# Getting a message send with PID of function process 
#receive do
#	{:hello, pid} -> IO.puts "receive pid: #{inspect pid}"
#end

#send parent, %{pid: self(), hello: "hello", world: "world"}

# flush List all message in mailbox of processes, only iex terminal

# Process raise error and block process, this spawn process not linked with other process
#spawn fn -> raise "opsss" end

# Linking process the raise process abort execute
#spawn_link fn -> raise "opss link" end

#spawn_link fn -> send self(), :hello end

#receive do
#	:hello -> "let's wait until raise process"
#end

# To get better loggin use Task
Task.start fn -> raise "opss with task" end