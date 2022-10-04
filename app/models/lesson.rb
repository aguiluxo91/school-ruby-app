class Lesson < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :hour, presence: true
    belongs_to :group
    belongs_to :teacher
    belongs_to :subject
    LESSON_TIME = 1
end
