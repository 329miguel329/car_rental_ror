class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      administrator_can_usages(user)
    end
  end

  private
  def administrator_can_usages(user)
    parametrization = [BloodType, CardType]
    administration = [User]
    case user.rol
    when "administrator"
      can :manage, :all
    when "driver"
      can [:create, :read], [Contract]
    when "passenger"
      cannot :manage, :all
    end
  end
end
