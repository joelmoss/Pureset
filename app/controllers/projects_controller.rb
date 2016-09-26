class ProjectsController < ApplicationController
  include AccountConcerns

  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_url(@project.accountable, @project), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_url(@project.accountable, @project), notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: t('.success')
  end

  private

    def set_project
      @project = @account.projects.find_by!(slug: params[:id])
    end

    def project_params
      if (accountable = params.dig(:project, :accountable))
        accountable_type, accountable_id = accountable.split('/')
        params[:project][:accountable_type] = accountable_type
        params[:project][:accountable_id] = accountable_id
        params[:project].delete :accountable
      end

      params.require(:project).permit(:name, :accountable_type, :accountable_id)
    end
end
