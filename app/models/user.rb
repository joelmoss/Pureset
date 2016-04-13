class User < Account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  # Virtual attribute for authenticating by either username or email This is in addition to a real
  # persisted field like 'username'
  attr_accessor :login

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }

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
end
