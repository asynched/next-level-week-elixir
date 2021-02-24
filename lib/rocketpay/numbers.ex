defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read
    |> handle_file
  end

  defp handle_file({:ok, file}) do
    result = file
      |> String.split(",")
      |> Stream.map(fn number -> number |> String.to_integer end)
      |> Enum.reduce(fn acc, next -> acc + next end)

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file"}}
end
