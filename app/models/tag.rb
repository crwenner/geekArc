class Tag < ActiveRecord::Base
  attr_accessible :name, :uniqueness => true

  has_and_belongs_to_many :posts
end
