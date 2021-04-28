class Task < ActiveRecord::Base
    validates :name, presence: true
    validates :team_id, presence: true
    validates :user_id, presence: true

    belongs_to :team
    belongs_to :user 

    scope :user, ->  (user) { where(user_id: user.id) }
    scope :completed, -> { where(complete: 1) }
    scope :in_progress, -> { where(complete: 0) }
end
