class Project < ApplicationRecord
  belongs_to :account, polymorphic: true
  acts_as_url :name, url_attribute: :slug, blacklist: %w{ users organizations issues projects }

  def to_param
    slug
  end
end
