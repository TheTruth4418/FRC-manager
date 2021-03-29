class Participant < ActiveRecord::Base
    validates :name, presence: true
    validates :team_number, presence: true
    validates :team_number, uniqueness: true

    belongs_to :event, optional: true
    has_one :scout
end
