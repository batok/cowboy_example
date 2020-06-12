defmodule CowboyExample do
  @moduledoc """
  Documentation for `CowboyExample`.
  """

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
    {:ok, req, opts}
  end
end
