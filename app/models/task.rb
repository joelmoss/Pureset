class Task < ApplicationRecord
  validates :summary, presence: true

  def to_s
    summary
  end

  def personal?
    true
  end
end
