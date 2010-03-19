class Group < ActiveRecord::Base
  has_many :jets, :dependent => :destroy
  has_many :pairs, :through => :jets
end
