class Task < ApplicationRecord
  belongs_to :contextable, polymorphic: true, required: true
  validates :summary, presence: true
  before_create :set_path
  acts_as_sequenced scope: [:contextable_id, :contextable_type]

  # rubocop:disable Metrics/MethodLength
  def self.states
    {
      backlog: {
        label: 'Backlog',
        closed: false
      },
      todo: {
        label: 'ToDo',
        closed: false
      },
      in_progress: {
        label: 'In Progress',
        closed: false
      },
      done: {
        label: 'Done',
        closed: true
      },
      duplicate: {
        label: 'Duplicate',
        closed: true
      },
      wont_do: {
        label: 'Won\'t Do',
        closed: true
      }
    }
  end
  # rubocop:enable Metrics/MethodLength

  # The available types for project based tasks.
  def self.types
    {
      'Task' => Task,
      'Bug' => Task::Bug
    }
  end

  def contextable_type=(class_name)
    super class_name.constantize.base_class.to_s
  end

  def to_s
    summary
  end

  def to_param
    sequential_id
  end

  def type
    self[:type].split('::').last
  end

  private

    def set_path
      self.path = "/#{contextable.to_param}/#{to_param}"
      self.path = "/#{contextable.accountable.to_param}#{path}" if contextable.is_a?(Project)
    end
end
