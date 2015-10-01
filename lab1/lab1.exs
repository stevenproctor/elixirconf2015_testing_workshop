defmodule Lab1 do
  def first_and_third([first, _second, third | _rest]) do
    {first, third}
  end

  def min(list) do
    Enum.reduce list, &min/2
  end

  def avg(list) do
    {total, count} = Enum.reduce list, {0, 0}, fn (item, {total, count}) -> {total + item, count+1} end
    total/count
  end

  def num_atoms(list) do
    Enum.count list, &is_atom/1
  end
end
