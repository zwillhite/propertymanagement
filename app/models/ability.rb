class Ability
  include CanCan::Ability
  
  def initialize(thisuser)
    thisuser ||= User.new #guest account
    
    if thisuser.has_role? :manager
      can :manage, :all
    else
      if thisuser.has_role? :renter
        can :manage, thisuser
        can :manage, RepairRequest, :submitter_id => thisuser.id
      end
      can :index, :all
    end
  end
end