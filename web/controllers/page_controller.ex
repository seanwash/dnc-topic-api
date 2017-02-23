defmodule Dnctopicapi.PageController do
  use Dnctopicapi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
