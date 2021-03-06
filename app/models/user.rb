class User < ActiveRecord::Base

  has_secure_password

  validates :email,
  presence: true,
  uniqueness: {case_sensitive:false},
  # format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,message: "valid email"}
  format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,message: "valid email"}

  validates_presence_of :password, on: :create

  validates :name, length: { maximum: 20 }

  has_many :posts

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
