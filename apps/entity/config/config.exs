use Mix.Config

{riak_port, ""} = Integer.parse(System.get_env("RIAK_PORT") || "8985")

config :pooler, pools:
  [
    [
      name: :riaklocal1,
      group: :riak,
      max_count: 10,
      init_count: 5,
      start_mfa: { Riak.Connection, :start_link,
        ['127.0.0.1', riak_port] 
      }
    ]
  ]
