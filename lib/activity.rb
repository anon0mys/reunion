# Does stuff
class Activity
  attr_reader :name, :participants

  def initialize(name, participants)
    @name = name
    @participants = participants
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end
end
