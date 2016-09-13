class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects.all
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to project_url(@project.accountable, @project), notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_url(@project.accountable, @project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

    def set_account
      @account = Account.find_by!(username: params[:account_id])
    end

    def set_project
      @project = @account.projects.find_by!(slug: params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
end
