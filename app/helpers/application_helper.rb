module ApplicationHelper
  def login?
    controller.send(:login?)
  end
end
