require 'test_helper'

class EnterpriseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should save one headquarters' do
    enterprise = Enterprise.create headquarters: addresses(:one),
                                   name:'asdf', number: '123', application_date: '2017-01-01'
    refute_nil enterprise.headquarters
  end

  test 'should save many work locations' do
    enterprise = Enterprise.create work_locations: [addresses(:one), addresses(:two)],
                                   name:'asdf', number: '123', application_date: '2017-01-01'
    assert_equal 2, enterprise.work_locations.count
  end
end
