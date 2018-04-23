defmodule RandomAccessStack do

  defstruct list: []

  def new, do: %RandomAccessStack{}

  def items(%RandomAccessStack{list: list}), do: list

  def count(%RandomAccessStack{list: list}), do: list |> length

  def peek(%RandomAccessStack{list: []}), do: raise "RandomAccessStack is empty"

  def peek(%RandomAccessStack{list: [top | _]}), do: top

  def pop(%RandomAccessStack{list: []}), do: raise "RandomAccessStack is empty"

  def pop(%RandomAccessStack{list: [top | rest]}) do

    {top, %RandomAccessStack{list: rest}}

  end

  def push(stack, element) do

    %RandomAccessStack{stack | list: [element] ++ stack.list}

  end

  def insert(%RandomAccessStack{list: list}, index, item) do

    %RandomAccessStack{list: list |> List.insert_at(index, item)}

  end

  def clear(%RandomAccessStack{}) do

    %RandomAccessStack{list: []}

  end

  def set(%RandomAccessStack{list: list}, index, item) do

    %RandomAccessStack{list: list |> List.replace_at(index, item)}

  end

  def remove(%RandomAccessStack{list: list}, index) do

    list |> List.pop_at(index) |> (fn ({head , tail}) ->
      {head, %RandomAccessStack{list: tail}}
    end).()

  end

end
