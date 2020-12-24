require 'require_all'
require 'faker'
require 'pry'
require_all './app/models/'
require_all 'db/pools'

# rake db:drop db:create db:migrate

def country_name
  prefixes = [
              'The Republic of ',
              "The People's Forgotten Union of ",
              "",
              "Saint ",
              "Plurinational State of "
             ]
  suffixes = [
              " Islands",
              "ania",
              " Republic"

             ]
             

  case rand(100) + 1
  when 1..25
    return prefixes.sample + Faker::Space.meteorite
  when 26..36
    return Faker::Space.meteorite + suffixes.sample
  else
    return Faker::Space.meteorite
  end
end

names = []
states = []
50.times { names << country_name} 

new_state = State.new

names.each do |name|
  states << { 
    population: rand(30_000..80_000),
    name: name,
    climate: Faker::TvShows::StarTrek.villain,
    terrain: Faker::Space.meteorite,
    description: Faker::Food.spice,
    anthem: Faker::Nation.national_sport,
    election_period: rand(3..5),
    national_flag: ''
  }
end

states.each do |state| 
  State.create(state)
end


# TODO: make a cron job for creating a new leader every state.election_period minutes
# which uses faker and saves name as a leader object

# fix the git stuff

# deploy

# generate a flag 

# generate a human avatar

# generate a villain avatar

# flag is probably easiest