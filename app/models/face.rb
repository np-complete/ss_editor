class Face < ActiveRecord::Base
  validates_presence_of :name, :character_id
  
  belongs_to :character
end
