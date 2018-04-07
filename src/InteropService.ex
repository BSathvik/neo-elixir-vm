defmodule InteropService do
  defmodule StackItem do
    defstruct value: <<>>

    def new(val, type) do
      case type do
        :bigInteger -> Integer.new(val)
        :integer    -> Integer.new(val)
        :float      -> Integer.new(val |> round)
        :boolean    -> Boolean.new(val)
        :bytearray  -> ByteArray.new(val)
        _ -> raise "Type not supported"
      end
    end

    def isStruct(%StackItem{}), do: false

    def getByteArray(%StackItem{value: val}), do: val

    def getBigInteger(%StackItem{value: val}) do
      raw = val
       |> :binary.part({0, :erlang.byte_size(val) - 1})
       |> :binary.decode_unsigned(:little)
      if :binary.last(val) |> :erlang.rem(2) == 1 do
        -1 * raw
      else
        raw
      end
    end

    def getBoolean(%StackItem{value: val}), do: val != <<0>>

    def getArray(%StackItem{}), do: raise "Not supported"

    def getMap(%StackItem{}), do: %{}

    def getString(%StackItem{value: val}), do: val |> :erlang.binary_to_list
  end
end