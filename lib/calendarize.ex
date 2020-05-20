defmodule Calendarize do
  @moduledoc """
  A small utility that generates a calendar month array given a date.
  """

  alias Date
  alias Timex

  @type build_options :: [week_start: Timex.Types.weekstart()]

  @doc """
  Generates a calendar month array given a Date or DateTime

  ## Examples

      iex> Calendarize.build(~D[2020-05-15])
      [
        [0, 0, 0, 0, 0, 1, 2],
        [3, 4, 5, 6, 7, 8, 9],
        [10, 11, 12, 13, 14, 15, 16],
        [17, 18, 19, 20, 21, 22, 23],
        [24, 25, 26, 27, 28, 29, 30],
        [31, 0, 0, 0, 0, 0, 0]
      ]

      iex> Calendarize.build(Timex.now)
      [
        [0, 0, 0, 0, 0, 1, 2],
        [3, 4, 5, 6, 7, 8, 9],
        [10, 11, 12, 13, 14, 15, 16],
        [17, 18, 19, 20, 21, 22, 23],
        [24, 25, 26, 27, 28, 29, 30],
        [31, 0, 0, 0, 0, 0, 0]
      ]
  """
  @spec build(Date.t() | DateTime.t()) :: list()
  def build(%Date{} = date) do
    get_dates(date, :sun)
  end

  def build(%DateTime{} = date) do
    get_dates(date, :sun)
  end

  def build(_) do
    raise("Must pass a valid Date or DateTime")
  end

  @doc """
  Generates a calendar month array given a date. Currently, `week_start` is the only option, and it can be any integer 1..7 or
  any string accepted by [Timex.day_to_num()](https://hexdocs.pm/timex/Timex.html#day_to_num/1)
  ## Examples
      iex> Calendarize.build(~D[2020-05-15], %{:week_start => :mon})
      [
        [0, 0, 0, 0, 1, 2, 3],
        [4, 5, 6, 7, 8, 9, 10],
        [11, 12, 13, 14, 15, 16, 17],
        [18, 19, 20, 21, 22, 23, 24],
        [25, 26, 27, 28, 29, 30, 31],
        [0, 0, 0, 0, 0, 0, 0]
      ]

      iex> Calendarize.build(Timex.now, %{:week_start => :mon})
      [
        [0, 0, 0, 0, 1, 2, 3],
        [4, 5, 6, 7, 8, 9, 10],
        [11, 12, 13, 14, 15, 16, 17],
        [18, 19, 20, 21, 22, 23, 24],
        [25, 26, 27, 28, 29, 30, 31],
        [0, 0, 0, 0, 0, 0, 0]
      ]
  """
  @spec build(DateTime.t() | Date.t(), build_options()) :: list()
  def build(%DateTime{} = date, %{:week_start => week_start} = _options) do
    get_dates(date, week_start)
  end

  def build(%Date{} = date, %{:week_start => week_start} = _options) do
    get_dates(date, week_start)
  end

  defp get_dates(date, week_start) do
    {:ok, first_day_of_month} = Date.new(date.year, date.month, 1)
    end_day = Date.days_in_month(date)
    start_day = Timex.days_to_beginning_of_week(first_day_of_month, week_start)

    for week <- 1..6 do
      for day <- 0..6 do
        get_date(week, day, start_day, end_day)
      end
    end
  end

  defp get_date(week, day_in_week, start_day, end_day) do
    day_in_month = (((week - 1) * 7) + day_in_week)
    if (day_in_month < start_day) or (day_in_month > (end_day + start_day - 1)) do
      0
    else
      day_in_month - start_day + 1
    end
  end
end
