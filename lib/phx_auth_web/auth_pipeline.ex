defmodule PhxAuthWeb.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :phx_auth,
    module: PhxAuth.Guardian,
    error_handler: PhxAuthWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
