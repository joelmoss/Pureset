class HomeController < ApplicationController
  def index
    if signed_in?
      # TODO: scope this to the current user
      @tasks = Task.all
      @projects = current_user.projects
    else
      render 'welcome'
    end
  end
end
