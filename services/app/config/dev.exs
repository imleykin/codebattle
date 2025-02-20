use Mix.Config

root_dir = File.cwd!()
# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.

config :codebattle, CodebattleWeb.Endpoint,
  https: [
    port: System.get_env("CODEBATTLE_PORT") || 4000,
    keyfile: Path.join(root_dir, "dev.key"),
    certfile: Path.join(root_dir, "dev.crt")
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  cache_static_lookup: false,
  watchers: [yarn: ["watch", cd: Path.expand("..", __DIR__)]]

# Watch static and templates for browser reloading.
config :codebattle, CodebattleWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/codebattle_web/views/.*(ex)$},
      ~r{lib/codebattle_web/templates/.*(eex|slim|slime|slimleex)$},
      ~r{lib/codebattle_web/live/.*(eex|slim|slime|slimleex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n", level: :debug

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :codebattle, Codebattle.Repo,
  username: System.get_env("CODEBATTLE_DB_USERNAME") || "postgres",
  password: System.get_env("CODEBATTLE_DB_PASSWORD") || "postgres",
  hostname: System.get_env("CODEBATTLE_DB_HOSTNAME") || "localhost",
  database: System.get_env("CODEBATTLE_DB_NAME") || "codebattle_dev",
  pool_size: 5

config :codebattle, Codebattle.Bot, timeout: 2_000
