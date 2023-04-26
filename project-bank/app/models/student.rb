class Student < ApplicationRecord
    has_many :projects
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
end