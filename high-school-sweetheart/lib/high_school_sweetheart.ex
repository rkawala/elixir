import String

defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> trim()
    |> at(0)
  end

  def initial(name) do
    (name
    |> first_letter()
    |> capitalize()) <> "."
  end

  def initials(full_name) do
    Enum.map_join(split(full_name), " ", fn name-> initial(name) end)
  end

  def pair(full_name1, full_name2) do
"""
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     #{initials(full_name1)}  +  #{initials(full_name2)}     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"""
  end
end
