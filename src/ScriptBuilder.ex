defmodule ScriptBuilder do

  def getUInt16(value, endian \\ :little) do
    if endian === :big do
      Base.encode16(<<value::16-big>>)
    else
      Base.encode16(<<value::16-little>>)
    end
  end

  def getUInt32(value, endian \\ :little) do
    if endian === :big do
      Base.encode16(<<value::32-big>>)
    else
      Base.encode16(<<value::32-little>>)
    end
  end

  def getUInt16(value, endian \\ :little) do
    if endian === :big do
      Base.encode16(<<value::64-big>>)
    else
      Base.encode16(<<value::64-little>>)
    end
  end

end
