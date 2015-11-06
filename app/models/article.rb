class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :user
  # mount_uploader :image, ImageUploader

  has_many :enrollments, dependent: :destroy
end
