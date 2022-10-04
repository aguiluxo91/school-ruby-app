class Student < User
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
    belongs_to :group
end