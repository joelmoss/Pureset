class TasksController < ApplicationController
  include AccountConcerns

  before_action :authenticate_user!, :set_context
  before_action :set_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
  end

  def new
    @task = task_context.tasks.build(type: 'Task')
  end

  def create
    @task = task_context.tasks.build(task_params)
    if @task.save
      redirect_to task_url, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_url, notice: t('.success')
    else
      render :edit
    end
  end

  private

    def set_context
      @project = @account.projects.find_by!(slug: params[:project_id]) if params.key?(:project_id)
    end

    def set_task
      @task = task_context.tasks.find_by(sequential_id: params[:id])
    end

    def task_params
      params.require(:task).permit(:summary, :description, :type)
    end

    def task_url
      if @task.contextable.is_a?(Project)
        project_task_url @task.contextable.accountable, @task.contextable, @task.sequential_id
      else
        super @task.contextable, @task.sequential_id
      end
    end
end
