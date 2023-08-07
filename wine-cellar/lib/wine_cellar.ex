defmodule WineCellar do
  @color_explanations [
    white: "Fermented without skin contact.",
    red: "Fermented with skin contact using dark-colored grapes.",
    rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
  ]

  @tuple_elements %{ year: 1, country: 2 }

  def explain_colors() do
    @color_explanations
  end

  def filter(cellar, color, opts \\ []) do
    bottles = Keyword.get_values(cellar, color)
    Enum.reduce(opts, bottles, fn opt, acc -> retain_bottles_matching_opt(acc, opt) end)
  end

  def retain_bottles_matching_opt(bottles, opt) do
    { opt_key, opt_value } = opt
    opt_column_number = @tuple_elements[opt_key]
    Enum.filter(bottles, fn bottle -> elem(bottle, opt_column_number) == opt_value end)
  end
end
