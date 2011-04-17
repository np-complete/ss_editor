class Dialog < ActiveRecord::Base
  validates_presence_of :story_id, :character_id, :face_id, :message, :line_num
  validates_uniqueness_of :line_num, :scope => :story_id
  
  belongs_to :story
  belongs_to :character
  belongs_to :face
end