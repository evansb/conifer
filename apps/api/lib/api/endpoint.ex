defmodule Api.Endpoint do
  use Phoenix.Endpoint, otp_app: :api

  socket "/socket", Api.UserSocket

  if code_reloading? do
    plug Phoenix.CodeReloader
  end
  
  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_api_key",
    signing_salt: "mAw4VkSW"

  plug CORSPlug 
  plug Api.Router
end
