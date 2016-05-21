class Activity < ApplicationRecord
  include Filterable
  belongs_to :activity_type
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :participants, class_name: 'User', join_table: :user_participates
end
