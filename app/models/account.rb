class Account < ApplicationRecord
  has_many :projects

  def to_s
    username
  end
end
