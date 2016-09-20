class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organizations = current_user.organizations
  end

  def new
    @organization = current_user.organizations.build
  end

  def create
    @organization = current_user.organizations.build(organization_params)
    if @organization.save
      current_user.organizations << @organization
      redirect_to account_url(@organization), notice: t('.success')
    else
      render :new
    end
  end

  private

    def organization_params
      params.require(:organization).permit(:name)
    end
end
