class User < ActiveRecord::Base
    attr_accessible :username, :email, :password, :password_confirmation, :lease_id

    acts_as_authentic
    #has_many_and_belongs_to_many :roles
    belongs_to :lease
    has_many :submittedreports, :class_name => 'RepairRequest'
    has_many :approvedreports, :class_name => 'RepairRequest'
end
