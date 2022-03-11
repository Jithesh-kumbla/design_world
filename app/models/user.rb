class User < ApplicationRecord
	has_secure_password
	validates :user_name, :email, :mobile, presence: true

	has_many :project_users, dependent: :destroy
	has_many :projects, through: :project_users
end
