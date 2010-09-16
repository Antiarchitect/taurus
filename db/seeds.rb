Building.create([
  {:name => 'главный'},
  {:name => '5'},
  {:name => '6'},
  {:name => '7'},
  {:name => '8'}
])

LessonType.create([
  {:name => 'лекция'},
  {:name => 'практика'},
  {:name => 'лабораторная работа'}
])

Faculty.create([
  {:name => 'ФМИ', :full_name => 'факультет математики и информатики'}
])

Position.create([
  {:name => 'ассистент', :short_name => 'асс.'},
  {:name => 'старший преподаватель', :short_name => 'ст.п.'},
  {:name => 'доцент', :short_name => 'доц.'},
  {:name => 'профессор', :short_name => 'проф.'}
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