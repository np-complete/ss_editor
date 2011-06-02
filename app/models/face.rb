class Face < ActiveRecord::Base
  has_attached_file :icon, :styles => {:thumb => ['74x74#', :png]}
  validates_presence_of :name, :character_id, :user_id

  belongs_to :character
  belongs_to :user

  def url
    icon.url(:thumb)
  end
end
