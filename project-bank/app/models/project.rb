class Project < ApplicationRecord
    belongs_to :course
    has_many :project_memberships
  
    validates :name, presence: true
    validates :description, presence: true
    validates :github_link, presence: true
    validates :members, presence: true
end