class Face < ActiveRecord::Base
  has_attached_file :icon, :styles => {:thumb => ['74x74#', :png]}
  validates_presence_of :name, :character_id
  
  belongs_to :character
end
