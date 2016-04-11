class HomeController < ApplicationController
  def index
    if signed_in?
      @issues = Issue.all
    else
      render 'welcome'
    end
  end
end
