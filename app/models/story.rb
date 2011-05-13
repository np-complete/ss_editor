class Story < ActiveRecord::Base
  validates_presence_of :title, :user_id
  
  has_many :dialogs, :order => 'line_num', :include => [:face, :character]
  belongs_to :user
  
  def update_dialog_orders!(orders)
    Dialog.update_all(['line_num = id + ?', dialogs.count],  ['story_id = ?', id])
    dialogs.each do |dialog|
      index = orders.index(dialog.id)
      raise Story::DialogOrderError if index.nil?
      dialog.update_attributes!(:line_num => index + 1)
    end
  end
  
  class DialogOrderError < StandardError ; end
end
