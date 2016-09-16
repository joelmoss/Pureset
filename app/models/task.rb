class Task < ApplicationRecord
  belongs_to :contextable, polymorphic: true, required: true
  validates :summary, presence: true
  before_create :set_path
  acts_as_sequenced scope: [:contextable_id, :contextable_type]

  def contextable_type=(class_name)
    super class_name.constantize.base_class.to_s
  end

  def to_s
    summary
  end

  def to_param
    sequential_id
  end

  private

    def set_path
      if contextable.is_a?(Project)
        self.path = "/#{contextable.accountable.to_param}/#{contextable.to_param}/#{to_param}"
      else
        self.path = "/#{contextable.to_param}/#{to_param}"
      end
    end
end
