module ProjectsHelper
  def new_project_path
    project_context ? super(project_context) : super
  end

  def projects_path
    project_context ? super(project_context) : super
  end
end
