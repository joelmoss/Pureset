class Project < ApplicationRecord
  belongs_to :account, polymorphic: true

  strip_attributes
  acts_as_url :name, url_attribute: :slug, blacklist: %w( users organizations issues projects )

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  def to_param
    slug
  end
end
