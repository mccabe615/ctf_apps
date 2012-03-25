class User < ActiveRecord::Base
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user
      if user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        "Invalid Password"
      end 
    else
       "Invalid Email"
    end
  end
  
  def encrypt_password(pwd=nil)
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    elsif pwd.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(pwd, password_salt)
    end
  end
end