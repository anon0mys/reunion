require 'erb'
require './lib/reunion'

# Runs reunion and builds erb html page
class ReunionRunner
  def initialize
    @reunion = Reunion.new('Denver')
    add_reunion_events
    erb_render
  end

  def add_reunion_events
    activities = { 'Boat Ride' => { 'Jim' => 10.00,
                                    'Bob' => 35.00 },
                   'Cabana' => { 'Jim' => 25.00,
                                 'Bob' => 5.00 } }
    activities.each do |name, participants|
      @reunion.add_activity(name, participants)
    end
  end

  def erb_render
    template = File.read('./lib/template.html.erb')
    renderer = ERB.new(template)
    result = renderer.result(binding)
    File.open('./lib/reunion_output.html', 'w') do |file|
      file.write(result)
    end
  end
end

ReunionRunner.new
