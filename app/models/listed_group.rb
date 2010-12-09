class ListedGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :groups_list
end

