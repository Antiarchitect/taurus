# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

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

Faculty.create([
  {:name => 'ИФФ', :full_name => 'Инженерно-физический факультет'},
  {:name => 'ФМИ', :full_name => 'Факультет математики и информатики'}
])