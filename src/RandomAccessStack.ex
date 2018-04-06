defmodule RandomAccessStack do

  defstruct list: []

  def new, do: %RandomAccessStack{}
  
  def push(stack, element), do: %RandomAccessStack{stack | list: [element] ++ stack.list}

  def pop(%RandomAccessStack{list: []}), do: raise "RandomAccessStack is empty"

  def pop(%RandomAccessStack{list: [top | rest]}), do: {top, %RandomAccessStack{list: rest}}

  def size(%RandomAccessStack{list: list}), do: list |> length

  def peek(%RandomAccessStack{list: []}), do: raise "RandomAccessStack is empty"

  def peek(%RandomAccessStack{list: [top | _]}), do: top

  def insert(%RandomAccessStack{list: list}, index, item) do
    %RandomAccessStack{list: list |> List.insert_at(index, item)}
  end

  def clear(%RandomAccessStack{list: list}), do: %RandomAccessStack{list: []}

  def set(%RandomAccessStack{list: list}, index, item) do
    %RandomAccessStack{list: list |> List.replace_at(index, item)}
  end
end
