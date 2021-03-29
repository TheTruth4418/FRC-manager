class Event < ActiveRecord::Base
    validates :name, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :team_id, presence:true

    has_many :confirms
    has_many :participants
    belongs_to :team
    has_many :users, through: :confirm
end
