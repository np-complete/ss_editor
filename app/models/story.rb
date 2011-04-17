class Story < ActiveRecord::Base
  validates_presence_of :title
  
  has_many :dialogs, :order => 'line_num', :include => [:face, :character]
end
