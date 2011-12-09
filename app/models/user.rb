# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'digest'

class User < ActiveRecord::Base
	attr_accessor :password_plain
	attr_accessible :name, :email, :password
 
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name,				:presence => true,
													:length	=> { :minimum => 2, :maximum => 50}
	validates :email,				:presence => true,
													:format => { :with => email_regex },
													:uniqueness => { :case_sensitive => false }
	validates :password,		:presence => true,
													:length	=> { :within => 6..50 }

	before_save :encrypt_password

	def has_password?(submitted_password)
		password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	private
		def encrypt_password
			self.salt = make_salt unless has_password?(password)
			self.password = encrypt(password)
		end

		def encrypt(plain_text)
			secure_hash("#{salt}--#{plain_text}")
		end

		def make_salt
			rand 0..4611686018427387904
		end

		def secure_hash(value)
			Digest::SHA2.hexdigest(value)
		end
end
