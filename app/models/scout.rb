class Scout < ActiveRecord::Base
    belongs_to :participant

    validates :participant_id, presence: true
end
