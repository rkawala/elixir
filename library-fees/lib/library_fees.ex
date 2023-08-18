defmodule LibraryFees do
  def datetime_from_string(string) do
    { :ok, result } = NaiveDateTime.from_iso8601(string)
    result
  end

  def before_noon?(datetime) do
    { secs, _ } =
      NaiveDateTime.to_time(datetime)
      |> Time.to_seconds_after_midnight
    secs < 12 * 3600
  end

  def return_date(checkout_datetime) do
    duration = case before_noon?(checkout_datetime) do
      true -> 28
      false -> 29
    end
    NaiveDateTime.add(checkout_datetime, duration, :day)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    date_returned = NaiveDateTime.to_date(actual_return_datetime)
    case Date.diff(date_returned, planned_return_date) do
      x when x > 0 -> x
      _ -> 0
    end
  end

  def monday?(datetime) do
    day_of_week_returned = NaiveDateTime.to_date(datetime)
      |> Date.day_of_week()
    case day_of_week_returned do
      1 -> true
      _ -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    due_date = return_date(datetime_from_string(checkout))
    date_returned = datetime_from_string(return)
    days_late = days_late(due_date, date_returned)
    amount = days_late * rate
    if monday?(date_returned) do div(amount, 2) else amount end
  end
end
