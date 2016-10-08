class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Removed :registerable so that visitors can not sign up.
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
