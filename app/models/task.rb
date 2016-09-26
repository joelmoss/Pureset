class Task < ApplicationRecord
  belongs_to :contextable, polymorphic: true, required: true
  validates :summary, presence: true
  before_create :set_path
  acts_as_sequenced scope: [:contextable_id, :contextable_type]

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
    read_attribute(:type).split('::').last
  end

  private

    def set_path
      self.path = "/#{contextable.to_param}/#{to_param}"
      if contextable.is_a?(Project)
        self.path = "/#{contextable.accountable.to_param}#{self.path}"
      end
    end
end
