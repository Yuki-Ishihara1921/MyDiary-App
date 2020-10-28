class Diary < ApplicationRecord
    validates :start_time, presence: { message: 'が未入力です！' }
    validates :title, presence: { message: 'が未入力です！' }
    belongs_to :user
    has_rich_text :content
end
