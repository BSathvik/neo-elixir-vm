import Mixins

defmodule CollectionMixin do
    
  isSynchronized = false
  syncRoot = nil

  @count 0

  def contains(self, item) do

  end

  def clear(self) do

  end

  def copyTo(self, array, index) do

  end

end

defmodule StackItem do

  @isStruct false

  @hash fn(self) ->
    hash = 17

    for b <- self.getByteArray do
      hash = hash * 31 + b
    end

    hash

  end


end
