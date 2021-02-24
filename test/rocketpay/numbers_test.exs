defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "When a file with the given name exists, return the sum" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "When a file doesn't exist, return an :error and a message" do
      response = Numbers.sum_from_file("banana")

      fail_response = "banana"

      expected_response = {:error, %{message: "Invalid file"}}

      assert response != fail_response
      assert response == expected_response
    end
  end
end
