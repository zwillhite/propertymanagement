class User < ActiveRecord::Base
    attr_accessible :username, :email, :password, :password_confirmation, :lease_id, :role_ids

    acts_as_authentic
    
    has_and_belongs_to_many :roles
    belongs_to :lease
    has_many :submittedreports, :class_name => 'RepairRequest'
    has_many :approvedreports, :class_name => 'RepairRequest'
    
    after_create :default_role
    
    def default_role
        self.roles << Role.where(:name => 'Renter').first
    end
    
    def has_role?(role_sym)
      roles.any? {|r| r.name.underscore.to_sym == role_sym}
    end
end