class Team < ActiveRecord::Base
    validates :name, presence: true

    has_many :users
    has_many :tasks

    scope :by_name, -> { order(name: :asc) }
end