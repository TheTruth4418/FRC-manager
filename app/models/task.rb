class Task < ActiveRecord::Base
    validates :name, presence: true
    validates :team_id, presence: true

    belongs_to :team
    belongs_to :user 

    scope :user, ->  (user) { where(user_id: user.id) }
end
