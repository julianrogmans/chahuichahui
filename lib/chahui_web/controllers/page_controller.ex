defmodule ChahuiWeb.PageController do
  use ChahuiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
