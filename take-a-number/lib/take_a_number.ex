defmodule TakeANumber do
  def start() do
    spawn(fn -> process(0) end)
  end

  defp process(last_number) do
    Process.info(self(), :messages)
    new_last_number = receive do
      { :report_state, sender_pid } ->
        send(sender_pid, last_number)
      { :take_a_number, sender_pid } ->
        send(sender_pid, last_number + 1)
      :stop -> -1
      _ -> last_number
    end
    if new_last_number >= 0, do: process(new_last_number)
  end
end
