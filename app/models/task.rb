class Task < ApplicationRecord
  belongs_to :contextable, polymorphic: true, required: true
  validates :summary, presence: true

  def contextable_type=(class_name)
    super class_name.constantize.base_class.to_s
  end

  def to_s
    summary
  end
end
