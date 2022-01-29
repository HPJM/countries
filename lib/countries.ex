defmodule Countries do
  @path Path.join([__DIR__, "data", "countries.json"])
  @external_resource @path
  @all_countries @path |> File.read!() |> Jason.decode!()
  @codes @all_countries |> Enum.map(&String.to_atom(&1["Code"])) |> Enum.sort()

  defmacro __using__(_) do
    ast =
      for %{"Code" => code, "Name" => name} <- @all_countries do
        atom_code = String.to_atom(code)

        quote do
          def from_code(unquote(code)), do: unquote(name)
          def from_code(unquote(atom_code)), do: unquote(name)

          def valid_code?(unquote(code)), do: true
          def valid_code?(unquote(atom_code)), do: true
        end
      end

    quote do
      unquote_splicing(ast)

      def codes, do: unquote(@codes)

      def valid_code?(_), do: false
    end
  end
end
