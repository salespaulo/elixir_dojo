defmodule KV.Supervisor do
	use Supervisor

	def start_link do
		Supervisor.start_link(__MODULE__, :ok)
	end

	@manager_name KV.EventManager
	@registry_sup_name KV.Registry.Supervisor

	def init(:ok) do
		children = [
			worker(GenEvent, [[name: @manager_name]]),
			supervisor(KV.Registry.Supervisor, [[name: @registry_sup_name]])
		]

		supervise(children, strategy: :one_for_one)
	end

end