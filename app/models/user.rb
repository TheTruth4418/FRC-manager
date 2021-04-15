class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable
    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password

    has_one :team
    has_many :tasks
    has_many :confirms
    has_many :events, through: :confirm

    scope :admin, -> { where(admin: 1) }
    scope :students, -> { where(admin: 0) }
    scope :by_username, -> { order(username: :asc) }
end