class Organization < Account
  has_many :projects, as: :accountable
end
