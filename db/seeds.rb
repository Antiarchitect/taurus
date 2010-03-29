# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

6.times do |week_day|
  7.times do |pair_number|
    2.times do |week_number|
      Timeslot.create(:week_number => week_number + 1, :week_day => week_day + 1,
        :pair_number => pair_number + 1)
    end
  end
end

Building.create([
  {:name => 'Главный'},
  {:name => '5'},
  {:name => '6'},
  {:name => '7'},
  {:name => '8'}
])

LessonType.create([
  {:name => 'Лекция'},
  {:name => 'Практика'},
  {:name => 'Лабораторная работа'}
])