class Project < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :accountable, polymorphic: true
  has_many :tasks, as: :contextable

  strip_attributes
  acts_as_url :name, url_attribute: :slug,
                     scope: [:accountable_type, :accountable_id],
                     blacklist: %w(users organizations tasks projects)

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  # The available project types.
  def self.types
    {
      'Standard Project' => Project,
      'Software Development' => Project::SoftwareDevelopment
    }
  end

  def to_param
    slug
  end

  def to_s
    name
  end

  def path
    project_path accountable, self
  end
end
