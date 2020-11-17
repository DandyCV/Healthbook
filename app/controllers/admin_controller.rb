class AdminController < ApplicationController
  def index
    @today_visits = Visit.where(start_time: Date.today..Date.today.next_day)
  end
end
