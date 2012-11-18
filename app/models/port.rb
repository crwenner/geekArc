class Port < ActiveRecord::Base
  attr_accessible :content, :date, :title

  has_many :tags
end
