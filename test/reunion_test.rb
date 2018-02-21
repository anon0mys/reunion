require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

# Tests reunion class
class ReunionTest < Minitest::Test
  def test_it_initializes_with_a_location
    reunion = Reunion.new('Denver')

    assert_instance_of Reunion, reunion
    assert_equal 'Denver', reunion.location
  end

  def test_it_can_add_activities
    reunion = Reunion.new('Belize')
    participants = { 'Hunter' => 200.00, 'Thompson' => 230.00 }
    reunion.add_activity('Skydiving', participants)

    assert_instance_of Activity, reunion.activities[0]
  end
end
