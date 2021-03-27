class User < ActiveRecord::Base
    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password

    has_one :team
    has_many :tasks
    belongs_to :confirm, optional: true
    has_many :events, through: :confirm

    scope :admin, -> { where(admin: 1) }
    scope :students, -> { where(admin: 0) }
end