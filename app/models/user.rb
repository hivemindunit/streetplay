class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable

  has_many :owns, class_name: 'Activity'
  has_and_belongs_to_many :participates, class_name: 'Activity', join_table: :user_participates
end
