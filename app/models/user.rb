class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy

  # User avatar
  has_one_attached :avatar

  # User roles
  enum role: [:user, :vip, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Decorator

  def name_or_email
    return name if name.present?
    return email.split('@')[0]
  end

end
