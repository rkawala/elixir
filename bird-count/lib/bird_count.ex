defmodule BirdCount do
  def today([]), do: nil
  def today(list) do
    hd(list)
  end

  def increment_day_count([]), do: [ 1 ]
  def increment_day_count([ head | tail]) do
    [ head + 1 | tail ]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([ head | tail]) do
    head == 0 || has_day_without_birds?(tail)
  end

  def total([]), do: 0
  def total([ head | tail]) do
    head + total(tail)
  end

  def busy_days([]), do: 0
  def busy_days([ head | tail]) do
    ternary(head >= 5, 1, 0) + busy_days(tail)
  end

  defp ternary(condition, if_true, if_false) do
    if (condition), do: if_true, else: if_false
  end
end
