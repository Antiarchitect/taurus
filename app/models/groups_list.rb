class GroupsList < ActiveRecord::Base
  has_many :listed_groups
  has_many :groups, :through => :listed_groups
end

