module TasksHelper
  def new_task_path
    if task_context
      path = "new_#{task_context.class.name.underscore}_task_path"
      send path, task_context.accountable, task_context
    else
      super
    end
  end
end
