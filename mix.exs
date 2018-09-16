defmodule Complementarity.MixProject do
  use Mix.Project

  def project do
    [
      app: :complementarity,
      version: "0.1.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Complementarity, []},
      env: [cowboy_port: 4000]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4"},
      {:plug, "~> 1.6"},
      {:poison, "~> 4.0"},
      {:cors_plug, "~> 1.5"}
    ]
  end
end
