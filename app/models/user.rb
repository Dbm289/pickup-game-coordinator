class User < ActiveRecord::Base
    has_secure_password

    has_many :user_teams
    has_many :teams, through: :user_teams
    has_many :courts, through: :teams

end