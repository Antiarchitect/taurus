class GroupsList < ActiveRecord::Base
  has_many :listed_groups
  has_many :groups, :through => :listed_groups

  validates_presence_of :name

  attr_accessible :name

  named_scope :with_groups, :include => :groups
end

