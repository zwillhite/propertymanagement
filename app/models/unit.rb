class Unit < ActiveRecord::Base
  belongs_to :property
  has_many :leases
end
