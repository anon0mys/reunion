# Does stuff
class Activity
  attr_reader :name, :participants

  def initialize(name, participants)
    @name = name
    @participants = participants
  end
end
