class User < ActiveRecord::Base
    validates :username, presence: true
    validates :username, uniqueness: true


    has_one :team
    has_many :tasks
    belongs_to :confirm
    has_many :events, through: :confirm
end