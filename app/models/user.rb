class User < ApplicationRecord
  
  acts_as_voter
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
# to avoid url injection I set a default user role to eace post model - devise docs on githum https://github.com/plataformatec/devise/wiki/How-To:-Add-a-default-role-to-a-User         
  has_many :wnews_posts
  has_many :pol_posts
  has_many :sport_posts
  has_many :tech_posts
end
