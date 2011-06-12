module ApplicationHelper
  def login?
    controller.send(:login?)
  end

  def mine?(obj)
    login? && obj.user_id == @auth.id
  end
end
