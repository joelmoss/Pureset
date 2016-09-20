class Member < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  enum role: { admin: 0 }
end
