# == Schema Information
#
# Table name: system_users
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  account            :string(255)      not null
#  encrypted_password :string(255)      not null
#  salt               :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class SystemUser < ActiveRecord::Base
  has_many :blogs, :dependent => :delete_all

  attr_accessor :password
  attr_accessible :name, :account, :password

  account_regex = /\A[a-z][a-z0-9\-\._]+\z/i

  validates :name,      :presence => true,
                        :length => { :minimum => 2, :maximum => 50}
  validates :account,   :presence => true,
                        :format => { :with => account_regex },
                        :length => { :minimum => 2, :maximum => 50},
                        :uniqueness => { :case_sensitive => false }
  validates :password,  :presence => true,
                        :length => { :within => 6..50 }

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(account, submitted_password)
    sys_user = find_by_account(account)
    return nil if sys_user.nil?
    return sys_user if sys_user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    sys_user = find_by_id(id)
    (sys_user && sys_user.salt == cookie_salt) ? sys_user : nil
  end

  private
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(plain_text)
      secure_hash("#{salt}--#{plain_text}")
    end

    def make_salt
      secure_hash("#{rand 999999999}")
    end

    def secure_hash(value)
      # TODO: start to use bcrypt
      Digest::SHA2.hexdigest(value)
    end
end
