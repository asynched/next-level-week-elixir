defmodule RocketpayWeb.RegisterController do
  use RocketpayWeb, :controller

  def register(conn, params) do

    {status, message} = handle_request(params)

    conn
    |> put_status(status)
    |> json(%{
      message: message
    })
  end

  defp handle_request(%{"name" => name}), do: {200, "Hello, #{name}!"}
  defp handle_request(_reason), do: {400, "Please provide a name"}
end
