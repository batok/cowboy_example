defmodule CowboyExample do
  @moduledoc """
  Documentation for `CowboyExample`.
  """
  require Logger

  @doc """
  Hello world.

  ## Examples

      iex> CowboyExample.hello()
      :world

  """
  def hello do
    :world
  end

  def init(req0, opts) do
    req = :cowboy_req.reply(200, %{"content-type" => "text/plain"}, "Hello world!", req0)
    info = :ranch.info(:http)
    Logger.info("ranch:info/1 when request : #{inspect info}")
    {:ok, req, opts}
  end
end
