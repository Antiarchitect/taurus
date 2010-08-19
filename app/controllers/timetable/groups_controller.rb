class Timetable::GroupsController < ApplicationController
  cattr_reader :days, :times, :weeks
  @@days = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота'
  ]
  @@times = [
    '08:15 - 09:45',
    '09:55 - 11:25',
    '11:35 - 13:05',
    '14:00 - 15:30',
    '15:40 - 17:10',
    '17:20 - 18:50',
    '19:00 - 20:30'
  ]
  @@weeks = [
    '1 неделя',
    '2 неделя'
  ]

  def index
    if params[:terminal]
      render :index_terminal
    end
  end
  
  def show
    if params[:terminal]
      @terminal = true
    end
    @group = Group.find_by_id(params[:id])
    charge_cards = @group.charge_cards
    pairs = Array.new
    charge_cards.each do |card|
      pairs << card.pairs
    end
    pairs.flatten!
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    @pairs = Array.new(@days.size).map!{Array.new(@times.size).map!{Array.new(@weeks.size).map!{Array.new}}}
    pairs.each do |pair|
      @pairs[pair.day_of_the_week - 1][pair.pair_number - 1][pair.week_number - 1] << pair
    end
  end
end
