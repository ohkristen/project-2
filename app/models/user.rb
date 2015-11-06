class User < ActiveRecord::Base
# VALIDATING NAME AND EMAIL #
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            #format: { with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false }

  # VALIDATING SECURE PASSWORD #
  has_secure_password
  validates :password, length: { minimum: 6 }

  has_many :comments, dependent: :destroy
  has_many :articles
  has_many :enrollments

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:  :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Follows a User
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  #unfollows a User
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  #returns true if the current_user is following the other_user
  def following?(other_user)
    follwoing.include?(other_user)
  end
end
