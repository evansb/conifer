defmodule Api.V1.StatusController do
  @moduledoc """
  Check API health 
  """
  use Api.Web, :controller

  def show(conn, _params) do
    json conn, %{status: "running"}
  end
end