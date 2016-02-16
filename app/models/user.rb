class User < Account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Virtual attribute for authenticating by either username or email This is in addition to a real
  # persisted field like 'username'
  attr_accessor :login

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    conditions[:username].downcase! if conditions[:username]
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["username = :value OR email = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

end
