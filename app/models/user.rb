class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :comments, dependent: :destroy

  # User avatar
  has_one_attached :avatar

  # User roles
  enum role: [:user, :vip, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Check avatar exist
  def is_avatar?
    return avatar.attached?
  end

  # If name is nil return email against name
  def name_or_email
    return name if name.present?
    return email.split('@')[0]
  end
end
