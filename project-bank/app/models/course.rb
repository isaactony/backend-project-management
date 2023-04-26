class Course < ApplicationRecord
    enum category: [:android, :fullstack, :web, :datascience]
    
    has_many :projects, dependent: :destroy
    has_many :cohorts, dependent: :destroy
    
    validates :name, presence: true
end