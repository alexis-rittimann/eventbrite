class Event < ApplicationRecord
  belongs_to :admin, :class_name => :User, :foreign_key => "user_id"
  has_many :attendances
  has_many :users, through: :attendances

end
