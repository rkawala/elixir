defmodule HighScore do
  import Map

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0) do
    put(scores, name, score)
  end

  def remove_player(scores, name) do
    delete(scores, name)
  end

  def reset_score(scores, name) do
    put(scores, name, 0)
  end

  def update_score(scores, name, score) do
    update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    keys(scores)
  end
end
