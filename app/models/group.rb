class Group < ApplicationRecord
    validates :group_number, numericality: { in: 1..6 }
    has_many :lessons
    has_many :students
end
