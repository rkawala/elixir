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
    Enum.reduce(opts, bottles, fn opt, acc -> Enum.filter(acc, fn bottle -> elem(bottle, @tuple_elements[elem(opt, 0)]) == elem(opt, 1) end) end)
  end
end
