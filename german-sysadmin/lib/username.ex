defmodule Username do
  def sanitize([]), do: []
  def sanitize([ head | tail ] = _username) do
    case head do
      head when (head >= ?a and head <= ?z) or head == ?_ -> prepend(head, sanitize(tail))
      head when head == ?ü -> prepend(?u, ?e, sanitize(tail))
      head when head == ?ö -> prepend(?o, ?e, sanitize(tail))
      head when head == ?ä -> prepend(?a, ?e, sanitize(tail))
      head when head == ?ß -> prepend(?s, ?s, sanitize(tail))
      _ -> sanitize(tail)
    end
  end

  defp prepend(ch1, ch2, tail) do
    prepend(ch1, prepend(ch2, tail))
  end

  defp prepend(ch, tail) do
    [ ch | sanitize(tail) ]
  end
end
