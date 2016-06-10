class Project < ApplicationRecord
  belongs_to :account, polymorphic: true

  strip_attributes
  acts_as_url :name, url_attribute: :slug,
                     scope: [ :accountable_type, :accountable_id ],
                     blacklist: %w( users organizations issues projects )

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  def to_param
    slug
  end

  def to_s
    name
  end
end
