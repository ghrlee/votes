require 'require_all'
require 'faker'
require 'pry'
require_all './app/models/'
require_all 'db/pools'

# rake db:drop db:create db:migrate

names = [
            'the Collective of Ominous Buzzing', 
            "the People's Republic of Body Hair", 
            'A Collective of Mollusks',
            'Trapped and Endlessly Running in Place',
            Faker::Space.meteorite,
            Faker::Space.meteorite,
            Faker::Space.meteorite,
            Faker::Space.meteorite,
            Faker::Space.meteorite,
            Faker::Space.meteorite,
            Faker::Space.meteorite,
            Faker::Space.meteorite,
            Faker::Space.meteorite
          ]

states = []
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