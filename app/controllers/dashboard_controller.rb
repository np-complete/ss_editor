# -*- coding: utf-8 -*-
class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @stories = current_user.stories
      @faces = current_user.faces
    else
      redirect_to :root
    end
  end

  def logout
    sign_out
    redirect_to root_url
  end
end
