defmodule HighScore do
  import Map

  @initial_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @initial_score) do
    put(scores, name, score)
  end

  def remove_player(scores, name) do
    delete(scores, name)
  end

  def reset_score(scores, name) do
    put(scores, name, @initial_score)
  end

  def update_score(scores, name, score) do
    update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    keys(scores)
  end
end
