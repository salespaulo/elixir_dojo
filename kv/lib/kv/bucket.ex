defmodule KV.Bucket do
  @doc """
  Starts a new bucket
  """
  def start_link do
    Agent.start_link(fn -> HashDict.new end)
  end

  @doc """
  Gets a value from the `bucket` by `key`
  """
  def get(bucket, key) do
    Agent.get(bucket, &HashDict.get(&1, key))
  end

  @doc """
  Puts the `value` for the ginven `key` in the `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &HashDict.put(&1, key, value))
  end

  @doc """
  Delete and return a `value` for the given `key`
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn dict -> 
      HashDict.pop(dict, key)
    end)
  end
end