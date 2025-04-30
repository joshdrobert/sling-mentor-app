class User < ApplicationRecord
  has_one :mentor, dependent: :destroy, class_name: 'Mentor', foreign_key: 'user_id', inverse_of: :user
  has_one :student, dependent: :destroy, class_name: 'Student', foreign_key: 'user_id', inverse_of: :user
  # enum role: { student: 0, mentor: 1, alumni: 2, admin: 3 }
  has_many :comments, dependent: :nullify
  has_many :questions, dependent: :nullify
  after_initialize :set_default_role, if: :new_record?
  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :mentor

  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name || auth.info.name.split.first
      user.last_name = auth.info.last_name || auth.info.name.split.last
      # user.image = auth.info.image
    end
  end

  def set_default_role
    self.role ||= 'student'
  end
end