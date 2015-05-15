defmodule KV.Registry.Supervisor do
	use Supervisor

	def start_link(opts \\ []) do
		Supervisor.start_link(__MODULE__, :ok, opts)
	end

	@manager_name KV.EventManager
	@buckets_sup_name KV.Bucket.Supervisor
	@registry_name KV.Registry
	@ets_registry_name KV.Registry

	def init(:ok) do
		ets = :ets.new(@ets_registry_name, [:set, :public, :named_table, {:read_concurrency, true}])

		children = [
			supervisor(KV.Bucket.Supervisor, [[name: @buckets_sup_name]]),
			worker(KV.Registry, [ets, @manager_name, @buckets_sup_name, [name: @registry_name]])
		]

		supervise(children, strategy: :one_for_all)
	end

end