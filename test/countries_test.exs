defmodule CountriesTest do
  use ExUnit.Case
  doctest Countries

  defmodule Example do
    use Countries
  end

  describe "use injects functionality" do
    test "from_code/1 accepts valid string code" do
      assert Example.from_code("GG") == "Guernsey"
    end

    test "from_code/1 accepts valid atom code" do
      assert Example.from_code(:GG) == "Guernsey"
    end

    test "valid_code?/1 returns whether code exists" do
      assert Example.valid_code?(:ES)
      assert Example.valid_code?("VN")
      refute Example.valid_code?(:GGG)
    end

    test "codes/0 returns all codes" do
      for code <- Example.codes() do
        assert Example.valid_code?(code)
      end
    end
  end
end
