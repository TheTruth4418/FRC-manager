class Task < ActiveRecord::Base
    validates :name, presence: true
    validates :team_id, presence: true

    belongs_to :team
    belongs_to :user 
end
