require 'securerandom'
require 'openssl'

class User < ApplicationRecord
  include OrganizationScopedModel
  organization_scoped

  DIGEST_ALGORITHM = 'sha256'
  DIGEST_SALT_SIZE = 16
  DIGEST_CONST_STRING = 'socent'
  DIGEST_SEPARATOR_TOKEN = '.'

  attr_accessor :password
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, if: :password_changed?
  before_save :digest_password_hash!, if: :password_changed?

  def is_password_match?(tested_password)
    return false if self.password_hash.nil? or self.password_salt.nil? or tested_password.nil?
    ActiveSupport::SecurityUtils.secure_compare(
      User.hash_password(self.password_salt, tested_password),
      self.password_hash)
  end

  def self.hash_password(salt, password)
    # computes the password hash as digest '<const_string>.<salt>.<password>'
    digest = OpenSSL::Digest.new DIGEST_ALGORITHM
    digest << DIGEST_CONST_STRING
    digest << DIGEST_SEPARATOR_TOKEN
    digest << salt
    digest << DIGEST_SEPARATOR_TOKEN
    digest << password
    digest.hexdigest  # we use hexdigets not raw digets because PG adapter/fixtures have problems handling binary
  end

  def password=(value)
    attribute_will_change!('password') if @password != value
    @password = value
  end

  def password_changed?
    changed.include?('password')
  end

  private
  def digest_password_hash!
    # use hex because of PG adapter issues with binary
    self.password_salt = SecureRandom.hex DIGEST_SALT_SIZE
    self.password_hash = User.hash_password(self.password_salt, self.password)
  end

end
