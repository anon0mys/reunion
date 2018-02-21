require 'pry'

# Managaes activities and tracks overall owed/owes for participants
class Reunion
  attr_reader :location, :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(name, participants)
    @activities << Activity.new(name, participants)
  end

  def total_reunion_cost
    @activities.map(&:total_cost).sum
  end

  def owed_summary
    @activities.map do |activity|
      [activity.name, activity.owed?]
    end.to_h
  end

  def individual_total_owed
    owed_summary.values.reduce do |result, activity|
      result.merge(activity) { |_key, sum, new_value| sum + new_value }
    end
  end
end
