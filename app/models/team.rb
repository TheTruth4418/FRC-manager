class Team < ActiveRecord::Base
    validates :name, presence: true

    has_many :users
    has_many :tasks

    scope :admin, -> { where(admin: 1) }
    scope :students, -> { where(admin: 0) }
    scope :by_username, -> { order(username: :asc) }
end