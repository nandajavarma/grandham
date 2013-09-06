class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  ROLES = %w[super_admin admin contributor publisher librarian]

  after_create :set_role

  def role?(key)
    role == key.to_s
  end

  private

  def set_role
    self.update_attribute :role, 'contributor' unless role
  end
end
