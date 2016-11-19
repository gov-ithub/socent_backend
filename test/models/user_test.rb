require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'Should save password_hash' do
    user = User.create(email: 'test_save_pwd@example.com', password: 'foo')
    assert_equal OpenSSL::Digest::SHA256.hexdigest(
        "socent.#{user.password_salt}.foo"),
        user.password_hash
    assert user.is_password_match?('foo')
  end

  test 'Fixtures password hash is correct' do
    one = users(:one)
    assert_equal '01234567', one.password_salt
    assert_equal OpenSSL::Digest::SHA256.hexdigest('socent.01234567.one'), one.password_hash
    assert one.is_password_match?('one')
    assert !one.is_password_match?('One')
    assert !one.is_password_match?('')
    assert !one.is_password_match?(nil)

    two = users(:two)
    assert two.is_password_match?('two')
  end

end
