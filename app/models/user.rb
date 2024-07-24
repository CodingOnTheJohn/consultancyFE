class User < ApplicationRecord
  before_save :downcase_username
  
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  private
  
  def downcase_username
    self.username = username.downcase
  end
end