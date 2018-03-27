defmodule ExecutionEngine do
  @VMState %{
    :none  => 0,
    :halt  => 1,
    :fault => 2,
    :break => 4
  }
  
end