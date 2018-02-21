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
end
