class Cohort < ApplicationRecord
    belongs_to :course
    
    validates :name, presence: true
    validates :number_of_students, presence: true, numericality: { greater_than: 0 }
end