require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

# Tests for the Activity class
class ActivityTest < Minitest::Test
  def setup
    @participants = { 'Tom' => 25.00, 'Jim' => 20.00 }
    @activity = Activity.new('Dinner', @participants)
  end

  def test_it_initializes_with_a_name
    assert_equal 'Dinner', @activity.name
  end

  def test_it_can_have_other_names
    activity = Activity.new('Concert', 'Tom' => 30.00)

    assert_equal 'Concert', activity.name
  end

  def test_it_has_participants
    assert_equal @participants, @activity.participants
  end

  def test_participants_hash_tracks_amounts_paid
    @activity.participants.each_value do |cost|
      assert cost.is_a? Float
    end
  end

  def test_you_can_add_participants
    @activity.add_participant('George', 15.00)

    assert @activity.participants.keys.include?('George')
    assert_equal 15.00, @activity.participants['George']
  end

  def test_total_activity_cost
    assert_equal 45.00, @activity.total_cost
  end

  def test_split_activity_cost
    assert_equal 22.50, @activity.split_cost
  end

  def test_evaluate_owed?
    shares = { 'Tom' => -2.5, 'Jim' => 2.5 }
    assert_equal shares, @activity.owed?
  end
end
