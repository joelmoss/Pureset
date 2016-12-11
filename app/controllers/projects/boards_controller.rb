class Projects::BoardsController < ApplicationController
  include AccountConcerns

  helper_method :current_board_name
  before_action :authenticate_user!, :set_project

  def show
    @tasks = @project.tasks.for_board(current_board_name)
    @bugs = @project.bugs.for_board(current_board_name)
  end

  private

    def set_project
      @project = @account.projects.find_by!(slug: (params[:project_id] || params[:id]))
    end

    def current_board_name
      params[:board_name] || @project.boards.keys.first.to_s
    end
end
