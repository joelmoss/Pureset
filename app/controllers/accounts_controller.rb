class AccountsController < ApplicationController

  def show
    @account = Account.find_by!(username: params[:username])
  rescue ActiveRecord::RecordNotFound
    redirect_back fallback_location: :root, alert: 'Cannot find that account'
  end

end
