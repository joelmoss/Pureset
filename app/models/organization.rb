class Organization < ApplicationRecord
  has_one :slug, as: :sluggable
  has_many :projects, as: :accountable
  has_many :tasks, as: :contextable
  has_many :members
  has_many :users, through: :members

  strip_attributes
  acts_as_url :name, url_attribute: :slug, blacklist: %w(users organizations tasks projects)

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  after_create :create_sluggable

  def to_s
    name
  end

  def to_param
    slug
  end

  private

    def create_sluggable
      create_slug slug: "/#{slug}"
    end
end
