class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :user_teams
    has_many :teams, through: :user_teams

end