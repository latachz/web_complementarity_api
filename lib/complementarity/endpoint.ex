defmodule Complementarity.Endpoint do
  use Plug.Router
  require Logger

  plug Plug.Logger
  # NOTE: The line below is only necessary if you care about parsing JSON
  plug Plug.Parsers, parsers: [:json], json_decoder: Poison
  plug :match
  plug :dispatch
  plug CORSPlug

  def init(options) do
    options
  end

  def start_link do
    port = Application.fetch_env!(:complementarity, :port)
    {:ok, _} = Plug.Adapters.Cowboy2.http(__MODULE__, [], port: port)
  end

  post "/api/dna" do
    {status, body} =
    case conn.body_params do
      %{"strand" => strand} -> {200, ComplementarityFunc.complementarity(strand)}
      _ -> {422, missing_strand()}
    end
    send_resp(conn, status, body)
  end

  # defp send_strand(strand) do
  #   Poison.encode!(%{response: "This, #{strand}!"})
  # end

  defp missing_strand do
    Poison.encode!(%{error: "Expected a \"strand\" key"})
  end

end
