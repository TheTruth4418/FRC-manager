class Event < ActiveRecord::Base
    validates :name, presence: true
    validates :date, presence: true
    validates :location, presence: true
    validates :team_id, presence:true

    belongs_to :confirm
    belongs_to :team
    has_many :users, through: :confirm
end
