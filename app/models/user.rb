class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  # Virtual attribute for authenticating by either username or email This is in addition to a real
  # persisted field like 'username'
  attr_accessor :login

  has_one :slug, as: :sluggable
  has_many :projects, as: :accountable
  has_many :tasks, as: :contextable
  has_many :members
  has_many :organizations, through: :members

  strip_attributes
  acts_as_url :username, url_attribute: :slug, blacklist: %w(users organizations tasks projects)

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  after_create :create_sluggable

  def self.find_for_database_authentication(warden_conditions) # rubocop:disable Metrics/AbcSize
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    conditions[:username].downcase! if conditions[:username]
    login = conditions.delete(:login)
    if login
      opts = { value: login.downcase }
      where(conditions.to_hash).find_by(['username = :value OR email = :value', opts])
    elsif conditions.key?(:username) || conditions.key?(:email)
      find_by conditions.to_hash
    end
  end

  def to_s
    username
  end

  def to_param
    slug
  end

  def gravatar_hash
    @gravatar_hash ||= Digest::MD5.hexdigest(email)
  end

  # TODO: include the current user's organizations
  def accountables
    [self].map { |a| [a.username, a.slug] }
  end

  private

    def create_sluggable
      create_slug slug: "/#{slug}"
    end
end
