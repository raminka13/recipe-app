class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Recipe, public: true
    can :read, Food, public: true

    return unless current_user.present? # additional permissions for logged in users (they can read their own posts)

    can :read, :all
    can :manage, User, user: current_user
    can :manage, Food, user: current_user
    can :manage, RecipeFood, user: current_user
    can :manage, Recipe, user: current_user
    # return unless current_user.role == 'admin' # additional permissions for administrators
  end
end
