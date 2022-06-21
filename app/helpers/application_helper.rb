module ApplicationHelper
  def formatted_duration(total_minute)
    hours = total_minute / 60
    minutes = (total_minute) % 60
    if hours > 0 && minutes > 0
      "#{ hours }h #{ minutes }min"
    elsif hours > 0
      "#{ hours }h"
    elsif minutes
      "#{ minutes }min"
    else
      "-"
    end
  end

  def pluralize(value, sing, plural)
    if value.nil?
      "0 " + sing
    elsif value > 1
      plural
    else
      value.to_s + " " + sing
    end
  end
end
