class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :admin
      can [ :index, :approve, :discard, :replace ], :admin_reviews
    elsif user.role? :contributor
      can :manage, [Book, Author, Publisher]
    else
      can :read, [Book, Author, Publisher]
    end
  end
end
