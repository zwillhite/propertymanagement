class Lease < ActiveRecord::Base
  belongs_to :unit
  has_many :renters, :class_name => 'User'
end
