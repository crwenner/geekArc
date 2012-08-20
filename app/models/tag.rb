class Tag < ActiveRecord::Base
  attr_accessible :name, :uniqueness => true
end
