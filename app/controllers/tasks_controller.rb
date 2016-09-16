class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_context
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = task_context.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = task_context.tasks.build(task_params)
    if @task.save
      redirect_to task_url, notice: t('.success')
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to task_url, notice: t('.success')
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: t('.success')
  end

  private

    def set_context
      if params.key?(:account_id)
        account = Account.find_by!(username: params[:account_id])
        instance_variable_set "@#{account.type.downcase}", account
        @project = account.projects.find_by!(slug: params[:project_id]) if params.key?(:project_id)
      end
    end

    def set_task
      @task = task_context.tasks.find_by(sequential_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:summary, :description)
    end

    def task_url
      if @task.contextable.is_a?(Project)
        project_task_url @task.contextable.accountable, @task.contextable, @task.sequential_id
      else
        super @task.contextable, @task.sequential_id
      end
    end
end
