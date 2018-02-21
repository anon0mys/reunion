require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

# Tests reunion class
class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new('Jamaica')
    @activities = { 'Boat Ride' => { 'Jim' => 10.00,
                                    'Bob' => 35.00 },
                   'Cabana' => { 'Jim' => 25.00,
                                 'Bob' => 5.00 } }
    @activities.each do |name, participants|
      @reunion.add_activity(name, participants)
    end
  end

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

  def test_it_can_add_multiple_activities
    @reunion.activities.each do |activity|
      assert_instance_of Activity, activity
    end
  end

  def test_it_can_total_the_cost_of_the_reunion
    assert_equal 75.00, @reunion.total_reunion_cost
  end
end
