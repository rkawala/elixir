defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    { :milliliter, get_volume(volume_pair) * lookup_conversion_factor(volume_pair) }
  end

  def from_milliliter(volume_pair, unit) do
    { unit, get_volume(volume_pair) / lookup_conversion_factor(unit) }
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end

  defp get_conversions() do
    %{milliliter: 1, teaspoon: 5, tablespoon: 15, fluid_ounce: 30, cup: 240}
  end

  defp lookup_conversion_factor(key) when is_atom(key) do
    get_conversions()[key]
  end

  defp lookup_conversion_factor(volume_pair) do
    key = get_unit(volume_pair)
    lookup_conversion_factor(key)
  end

  defp get_unit(volume_pair) do
    elem(volume_pair, 0)
  end
end
