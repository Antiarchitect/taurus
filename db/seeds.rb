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

Admin.create([
  { :login => "admin", :name => "Воронков Андрей Алексеевич",
    :email => "voronkovaa@gmail.com", :password => "12345678", :password_confirmation => "12345678"}
])

Supervisor.create([
  { :login => "supervisor", :name => "Воронков Андрей Алексеевич",
    :email => "supervisor@example.com", :password => "12345678", :password_confirmation => "12345678"}
])

Editor.create([
  { :login => "editor", :name => "Воронков Андрей Алексеевич",
    :email => "editor@example.com", :password => "12345678", :password_confirmation => "12345678"}
])

DeptHead.create([
  { :login => "dept_head", :name => "Воронков Андрей Алексеевич",
    :email => "dept_head@example.com", :password => "12345678", :password_confirmation => "12345678"}
])