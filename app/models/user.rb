class User < ActiveRecord::Base
    has_secure_password

    belongs_to :team 
    has_many :courts, through: :team

end