class Scout < ActiveRecord::Base
    belongs_to :participant

    validates :participant_id, presence: true

    scope :event_scouts, ->(event) {where("event_id: = ?", event)}
end
