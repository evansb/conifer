defmodule Api.Router do
  use Api.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      get "/status", StatusController, :show
    end
  end
end
