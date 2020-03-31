defmodule ElixirCrudApiWeb.PageController do
  use ElixirCrudApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
