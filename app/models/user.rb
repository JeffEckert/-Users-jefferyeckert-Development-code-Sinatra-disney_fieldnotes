class User < ActiveRecord::Base
     has_many :attractions
     validates :username, uniqueness: true
     has_secure_password

end