class Confirm < ActiveRecord::Base
    validates :user_id, presence: true
    validates :event_id, presence: true
    validates :user_id, uniqueness: { scope: :event_id, message: "Student's have one confirm per event!"}

    belongs_to :event
    belongs_to :user
end