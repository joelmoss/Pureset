module TasksHelper
  def new_task_path
    if task_context
      if task_context.respond_to?(:accountable)
        path = "new_#{task_context.class.name.split('::').first.underscore}_task_path"
        send path, task_context.accountable, task_context
      else
        super task_context
      end
    else
      super
    end
  end

  def tasks_path
    if task_context && task_context.respond_to?(:accountable)
      path = "#{task_context.class.name.split('::').first.underscore}_tasks_path"
      send path, task_context.accountable, task_context
    else
      super
    end
  end
end
