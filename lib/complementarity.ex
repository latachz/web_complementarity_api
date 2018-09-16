defmodule Complementarity do
  @moduledoc "The main OTP application for Complementarity"

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Complementarity.Endpoint, [])
    ]

    opts = [strategy: :one_for_one, name: Complementarity.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
