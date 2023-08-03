defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    ask("name")
  end

  def ask_class() do
    ask("class")
  end

  def ask_level() do
    String.to_integer(ask("level"))
  end

  def run() do
    welcome()
    result = %{ name: ask_name(), class: ask_class(), level: ask_level() }
    IO.inspect(result, [ label: "Your character" ])
  end

  defp ask(noun) do
    String.trim(IO.gets("What is your character's #{noun}?\n"))
  end
end
