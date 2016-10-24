class Project
  class SoftwareDevelopment < Project
    BOARDS = {
      backlog: {
        label: 'Backlog',
        task_statuses: [:backlog]
      },
      development: {
        label: 'Development',
        task_statuses: [:todo, :in_progress]
      },
      # qa: {
      #   label: 'QA',
      #   task_statuses: [:in_progress]
      # },
      done: {
        label: 'Done',
        task_statuses: [:done]
      }
    }.freeze
  end
end
