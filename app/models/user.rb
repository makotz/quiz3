class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :nullify

  has_many :likes, dependent: :nullify
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :members, dependent: :nullify
  has_many :member_ideas, through: :members, source: :idea

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}"
  end

end
