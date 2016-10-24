class Project < ApplicationRecord
  include Rails.application.routes.url_helpers

  BOARDS = {
    backlog: {
      label: 'Backlog',
      task_statuses: [:backlog]
    },
    development: {
      label: 'Development',
      task_statuses: [:todo]
    },
    done: {
      label: 'Done',
      task_statuses: [:done]
    }
  }.freeze

  belongs_to :accountable, polymorphic: true
  has_many :tasks, as: :contextable do
    def for_board(board_name)
      where status: proxy_association.owner.boards[board_name.to_sym][:task_statuses]
    end
  end

  strip_attributes
  acts_as_url :name, url_attribute: :slug,
                     scope: [:accountable_type, :accountable_id],
                     blacklist: %w(users organizations tasks projects)

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  # The available project types.
  def self.types
    {
      'Standard Project' => Project,
      'Software Development' => Project::SoftwareDevelopment
    }
  end

  def boards
    self.class::BOARDS
  end

  def to_param
    slug
  end

  def to_s
    name
  end

  def path
    project_path accountable, self
  end
end
