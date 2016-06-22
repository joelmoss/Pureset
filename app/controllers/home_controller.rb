class HomeController < ApplicationController
  def index
    if signed_in?
      # TODO: scope this to the current user
      @issues = Issue.all
      @projects = current_user.projects
    else
      render 'welcome'
    end
  end
end
