class AccountsController < ApplicationController
  def show
    @account = Slug.find_by!(slug: "/#{params[:id]}").sluggable
  end
end
