defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    parts = String.split(path, ".")
    Enum.reduce(parts, data, &(&2[&1]))
  end

  def get_in_path(data, path) do
    parts = String.split(path, ".")
    get_in(data, parts)
  end
end
