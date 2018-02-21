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

  def split_cost
    total_cost / @participants.keys.length
  end

  def owed?
    @participants.map do |participant, paid|
      [participant, split_cost - paid]
    end.to_h
  end
end
