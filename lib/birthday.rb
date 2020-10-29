require 'date'

class Birthday
  def initialize (day,month)
    @day = day.to_i
    @month = month.to_i
  end

  def calculate
    today = DateTime.now
    birthday = Date.new(today.year, @month, @day)
    days_to_go = (birthday - today).to_i
    days_to_go += 365 if days_to_go < 0
    days_to_go
  end
end
