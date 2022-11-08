class Student < ApplicationRecord
    belongs_to :instructor

    validates :name, presence: true
    validates :instructor, presence: true
    # validates :age, numericality: { greater_than: 18 }
    validate :older_than_18

    def older_than_18
        unless self.age >= 18
            self.errors.add(:age, "must be older than 18")
        end
    end
end
