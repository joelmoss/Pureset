class Account < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :projects
  has_many :tasks, as: :contextable

  strip_attributes
  acts_as_url :username, url_attribute: :slug, blacklist: %w( users organizations tasks projects )

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  def to_s
    username
  end

  def to_param
    slug
  end
end
