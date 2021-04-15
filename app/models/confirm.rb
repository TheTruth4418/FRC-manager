class Confirm < ActiveRecord::Base
    validates :user_id, presence: true
    validates :event_id, presence: true
    validates_uniqueness_of :user_id, scope: :event_id

    belongs_to :event
    belongs_to :user
end