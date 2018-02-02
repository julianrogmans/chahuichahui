defmodule ChahuiWeb.Router do
  use ChahuiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    # plug Guardian.Plug.Pipeline, module: ChahuiWeb.Guardian,
    #                     error_handler: ChahuiWeb.AuthErrorHandler
    # plug Guardian.VerifyHeader, realm: "Bearer"
    plug :accepts, ["json"]
  end

  forward "/graphql", Absinthe.Plug, schema: ChahuiWeb.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: ChahuiWeb.Schema

  scope "/", ChahuiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:page", PageController, :index
  end
  # Other scopes may use custom stacks.
  # scope "/api", ChahuiWeb do
  #   pipe_through :api
  # end
end
