class Confirm < ActiveRecord::Base
    validates :user_id, presence: true
    validates :evnet_id, presence: true

    belongs_to :event
    belongs_to :user
end