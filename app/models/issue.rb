class Issue < ApplicationRecord
  validates :summary, presence: true


  def to_s
    summary
  end

end
