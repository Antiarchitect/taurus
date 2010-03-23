class Department < ActiveRecord::Base
  belongs_to :faculty

  acts_as_chainable :from => :faculty, :select_label => 'Кафедра'
end
