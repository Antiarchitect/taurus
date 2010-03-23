class Faculty < ActiveRecord::Base
  has_many :departments

  acts_as_chainable :to => :department, :root => true, :select_label => 'Факультет'
end
