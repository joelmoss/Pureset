module Extensions::TasksForBoard
  def for_board(board_name)
    where status: proxy_association.owner.boards[board_name.to_sym][:task_statuses]
  end
end